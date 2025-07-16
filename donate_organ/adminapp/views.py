from django.shortcuts import render,redirect
from django.contrib import messages
from userapp.models import *
from userapp.blockchainalgo import Organ_blockchain
from django.core.paginator import Paginator

# Create your views here.
def main_admin(request):
    if request.method == "POST":
        name = request.POST.get("name")
        password = request.POST.get("password")
        
        if name == "admin" and password == "admin":
            messages.success(request,"admin login successfully")
            return redirect("admin_dashboard")
        else:
            messages.error(request,"invalid admin name and password")
    return render(request,'main/main-admin.html')

def admin_dashboard(request):
    users = RegistrationModels.objects.all().count()
    applications = OrganapplicationModels.objects.all().count()
    pending = OrganapplicationModels.objects.filter(status = "pending").count()
    fit = OrganapplicationModels.objects.filter(status = "Fit").count()
    return render(request,'admin/admin-dashboard.html',{"users":users, "applications":applications, "pending":pending, "fit":fit})

def admin_pendinguser(request):
    pending = OrganapplicationModels.objects.filter(status = "pending")
    paginator = Paginator(pending,4)
    pageno = request.GET.get('page')
    pending = paginator.get_page(pageno)
    return render(request,'admin/admin-pendinguser.html',{"data":pending})

def admin_alluser(request):
    pending = OrganapplicationModels.objects.all()
    paginator = Paginator(pending,4)
    pageno = request.GET.get('page')
    pending = paginator.get_page(pageno)
    return render(request,'admin/admin-alluser.html',{"user":pending})

def admin_organdonor(request):
    organdonor = OrganapplicationModels.objects.all()
    paginator = Paginator(organdonor,4)
    pageno = request.GET.get('page')
    organdonor = paginator.get_page(pageno)
    return render(request,'admin/admin-organdonor.html',{"organdonor":organdonor})

def admin_deathcertificate(request):
    deathcertificate = OrganapplicationModels.objects.filter(status = "Fit", issued_status = "Not issued" )
    paginator = Paginator(deathcertificate,4)
    pageno = request.GET.get('page')
    deathcertificate = paginator.get_page(pageno)
    return render(request,'admin/admin-deathcertificate.html',{"deathcertificate":deathcertificate})

def admin_feedbackanalysis(request):
    feedbackanalysis = feedbackM.objects.all()
    paginator = Paginator(feedbackanalysis,4)
    pageno = request.GET.get('page')
    feedbackanalysis = paginator.get_page(pageno)
    return render(request,'admin/admin-feedbackanalysis.html',{'data':feedbackanalysis})

def admin_sentimentanalysis(request):
    fit = OrganapplicationModels.objects.filter(status = 'Fit').count()
    notissued = OrganapplicationModels.objects.filter(issued_status = 'Not issued').count()
    issued = OrganapplicationModels.objects.filter(issued_status = 'issued').count()
    unfit = OrganapplicationModels.objects.filter(status = 'Un Fit').count()
    conductingtest = OrganapplicationModels.objects.filter(status = 'Conducting Test').count()
    return render(request,'admin/admin-sentimentanalysis.html',{'f':fit,'n':notissued, 'i':issued, 'u':unfit, 'c':conductingtest})

def issued(request,organ_id):
    a = OrganapplicationModels.objects.get(organ_id = organ_id)
    a.issued_status = 'issued'
    a.save(update_fields= ['issued_status'] )
    a.save()
    return redirect('admin_deathcertificate')

def reject(request,organ_id):
    a = OrganapplicationModels.objects.get(organ_id = organ_id)
    a.issued_status = 'rejected'
    a.save(update_fields= ['issued_status'])
    a.save()
    return redirect('admin_deathcertificate')

def verify_application(request,id):
    organ = OrganapplicationModels.objects.get(pk = id)
    
    
    key = "asdfhalskdhfasdhfkajd1234asdf12341234"
            
    initial_block = Organ_blockchain (key,[str(organ.Name),str(organ.Phone)])
    
    second_block = Organ_blockchain(initial_block.block_hash,[str((organ.Disease))])
    
    third_block = Organ_blockchain(second_block.block_hash,[str((organ.Donate_Organ))])
    
    if (organ.block1 == initial_block.block_hash and organ.block2 == second_block.block_hash) and (organ.block3 == third_block.block_hash):
    
        a=OrganapplicationModels.objects.get(pk=id)
        a.verification_status = 'valid'
        a.save(update_fields= ['verification_status'])
        messages.success(request,"The data is valid")
        return render(request,"admin/admin-verifyapplication.html",{'i':a})
    
    else:
        a=OrganapplicationModels.objects.get(pk=id)
        a.verification_status = 'invalid'
        a.save(update_fields = ['verification_status'])
        messages.info(request,"The data has been tempared")
    return render(request,"admin/admin-verifyapplication.html",{'i':a})