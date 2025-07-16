from django.shortcuts import render,redirect
from userapp.models import *
from django.contrib import messages
from textblob import TextBlob
from userapp.blockchainalgo import Organ_blockchain
# Create your views here.
def main_registration(request):
    if request.method == "POST" and request.FILES['photo']:
        
        name = request.POST.get("name")
        father = request.POST.get("father")
        email = request.POST.get("email")
        phone = request.POST.get("phone")
        city = request.POST.get("city")
        dob = request.POST.get("date")
        photo = request.FILES["photo"]
        password = request.POST.get("password")
        gender = request.POST.get("gender")
        
        try:
            RegistrationModels.objects.get(email = email)
            messages.info(request,"email already existed")
            return redirect('main_registration')
        except:
            RegistrationModels.objects.create(
                name = name,
                father = father,
                email = email,
                phone = phone,
                city = city,
                dob = dob,
                photo = photo,
                password = password,
                gender = gender,
            )
            messages.success(request,"User Registered Sucessfully")
    return render(request,"main/main-registration.html")

def main_user(request):
    if request.method == "POST":
        emaill = request.POST.get("email")
        passwordd = request.POST.get("password")
        
        print(emaill,passwordd)
        try:
            user = RegistrationModels.objects.get(email = emaill,password = passwordd)
            request.session['user_id'] = user.user_id
            messages.success(request,'Login Sucessfully')
            return redirect("user_dashboard")
        except:
            messages.error(request,'Invalid email and password')
            return redirect("main_user")
    return render(request,"main/main-user.html")

def user_dashboard(request):
    users = RegistrationModels.objects.all().count()
    applications = OrganapplicationModels.objects.all().count()
    
    organ1 = request.session['user_id']
    organ = RegistrationModels.objects.get(user_id = organ1)
    organ2 = OrganapplicationModels.objects.filter(use = organ.user_id).count()
    
    return render(request,"user/user-dashboard.html",{"users":users, "applications":applications, "organ2":organ2})

def user_donateorgan(request):
    user_id = request.session["user_id"]
    user_organ = RegistrationModels.objects.get(user_id = user_id)
    
    if request.method == "POST":
        name = request.POST.get("name")
        father = request.POST.get("father")
        email = request.POST.get("email")
        phone = request.POST.get("phone")
        city = request.POST.get("city")
        disease = request.POST.get("self")
        gender = request.POST.get("gender")
        dob = request.POST.get("date")
        organ = request.POST.getlist("value")
        
        try:
            OrganapplicationModels.objects.get(Email = email)
            messages.info(request,"email already exists")
            return redirect('user_donateorgan')
        except:
            blockchain = OrganapplicationModels.objects.create(
                    Name = name,
                    Father = father,
                    Email = email,
                    Phone = phone,
                    City = city,
                    Disease = disease,
                    Gender = gender,
                    Date_Of_Birth = dob,
                    Donate_Organ = organ,
                    use = user_organ
                )
            
            key = "asdfhalskdhfasdhfkajd1234asdf12341234"
            
            initial_block = Organ_blockchain (key,[str(blockchain.Name),str(blockchain.Phone)])
            blockchain.block1 = initial_block.block_hash
            
            second_block = Organ_blockchain(initial_block.block_hash,[str((blockchain.Disease))])
            blockchain.block2 = second_block.block_hash
            
            third_block = Organ_blockchain(second_block.block_hash,[str((blockchain.Donate_Organ))])
            blockchain.block3 = third_block.block_hash
            blockchain.save()
            
            messages.success(request,"Organ Donation Application has send successfully")
        
    return render(request,"user/user-donateorgan.html",{"user_organ":user_organ})

def user_mystatus(request):
    id = request.session['user_id']
    user = RegistrationModels.objects.get(user_id=id)
    try:
        status  = OrganapplicationModels.objects.get(use = user)
    except:
        status = None
    return render(request,"user/user-mystatus.html",{"status":status})

def user_myprofile(request):
    id = request.session['user_id']
    user = RegistrationModels.objects.get(user_id = id)
    if request.method == "POST":
        name = request.POST.get('name')
        mobile = request.POST.get('mobile')
        father = request.POST.get('father')
        emails = request.POST.get('email')
        dob = request.POST.get('dob')
        gender = request.POST.get('gender')
        
        if len(request.FILES) !=0:
            image = request.FILES['photo']
            user.name = name
            user.phone = mobile
            user.father = father
            user.email = emails
            user.dob = dob
            user.gender = gender
            user.photo = image
            user.save()
            
        else:
            user.name = name
            user.phone = mobile
            user.father = father
            user.email = emails
            user.dob = dob
            user.gender = gender
            user.save()
        messages.success(request,"profile has been updated successfully")
    return render(request,"user/user-myprofile.html",{"data":user})

def user_myfeedback(request):
    user_id = request.session['user_id']
    try:
        feedback = RegistrationModels.objects.get(user_id = user_id)
        print(feedback,"tiger")
        if request.method == "POST":
            overall = request.POST.get('rating1')
            travelling = request.POST.get('rating2')
            suggestion = request.POST.get('commentText')
            analysis = TextBlob(suggestion)
      
            
            if not overall:
                messages.info(request,"Please give the overall ratings")
                return redirect(user_myfeedback)
            if not travelling:
                messages.info(request,"Please give the travelling ratings")
                return redirect(user_myfeedback)
            sentiment = ''
            if analysis.polarity >= 0.5:
                sentiment = 'VeryPositive'
            elif analysis.polarity > 0 and analysis.polarity < 0.5:
                sentiment = 'Positive'
            elif analysis.polarity < 0 and analysis.polarity >= -0.5:
                sentiment = 'Negative'
            elif analysis.polarity <= -0.5:
                sentiment = 'VeryNegative'
            else:
                sentiment = 'Neutral'
            try:
                feedbackM.objects.create(overall=overall,travelling=travelling,suggestion=suggestion,feedback2=feedback,sentiment=sentiment)
            except:pass
            messages.success(request,"Feedback has been send successfully")
    except:
        feedback = None
    return render(request,"user/user-myfeedback.html",{'np':feedback})

def calculater(request):
    res=''
    try:
        if request.method == "POST":
            num1 = eval(request.POST.get("num1"))
            num2 = eval(request.POST.get("num2"))
            res = request.POST.get("res")
            if res == "+":
                res = num1+num2;
            elif res == "-":
                res = num1-num2;
            elif res == "/":
                res = num1/num2;
            elif res == "%":
                res = num1%num2;
            elif res == "*":
                res = num1*num2;
                print(res,"tiger")
    except:
        messages.info(request,"Invalid number")
    return render(request,"user/calculater.html",{'res':res})