from django.shortcuts import render,redirect
from django.contrib import messages
from userapp.models import *
from hospitalapp.models import *
from django.core.paginator import Paginator


# Create your views here.
def main_hospital(request):
    if request.method == "POST":
        name = request.POST.get("name")
        password = request.POST.get("password")
        
        if name == "hospital" and password == "hospital":
            messages.success(request,"hospital login successfully")
            return redirect("hospital_dasboard")
        else:
            messages.error(request,"invalid hospital name and password")
    return render(request,'main/main-hospital.html')

def hospital_dasboard(request):
    register = OrganapplicationModels.objects.all().count()
    fit = OrganapplicationModels.objects.filter(status = "Fit").count()
    test = OrganapplicationModels.objects.filter(status = "Conducting Test").count()
    unfit = OrganapplicationModels.objects.filter(status = "Un Fit").count()
    return render(request,'hospital/hospital-dashboard.html',{"register":register, "fit":fit, "test":test, "unfit":unfit})

def hospital_registereddonors(request):
    register = OrganapplicationModels.objects.all()
    paginator = Paginator(register,4)
    pageno = request.GET.get('page')
    register = paginator.get_page(pageno)
    return render(request,'hospital/hospital-registereddonors.html',{"register":register})

def hospital_availabledonor(request):
    availabledonor = OrganapplicationModels.objects.filter(issued_status = "issued" )
    paginator = Paginator(availabledonor,4)
    pageno = request.GET.get('page')
    availabledonor = paginator.get_page(pageno)
    return render(request,'hospital/hospital-availabledonor.html',{'availabledonor':availabledonor})


def hospital_searchbylocation(request):
    location=None
    try:
        if request.method == "POST":
            name = request.POST.get("loc")
            location = OrganapplicationModels.objects.get(City=name)
    except:
        messages.info(request,"Not Found")
    return render(request,'hospital/hospital-searchbylocation.html',{'loc':location})

def hospital_searchbyorgan(request):
    organ = None
    try:
        if request.method == "POST":
            name = request.POST.get("organ")
            organ = OrganapplicationModels.objects.get(Donate_Organ = name)
    except:
        messages.info(request,"Not Found")
    return render(request,'hospital/hospital-searchbyorgan.html',{'organ':organ})

def hospital_view(request,organ_id):
    view = OrganapplicationModels.objects.get(organ_id = organ_id)
    if request.method == "POST":
        name = request.POST.get("name")
        gender = request.POST.get("gender")
        dob = request.POST.get("dob")
        donate_organ = request.POST.get("donateorgan")
        disease = request.POST.get("disease")
        email = request.POST.get("email")
        status = request.POST.get("test")
        
        view.Name = name
        view.Gender = gender
        view.Date_Of_Birth = dob
        view.Donate_Organ = donate_organ
        view.Disease = disease
        view.Email = email
        view.status = status
        view.save()
        
        
        HospitalregistratedModels.objects.create(
            Name = name,
            Gender = gender,
            Date_Of_Birth = dob,
            Donate_Organ = donate_organ,
            Disease =  disease,
            Email = email,
            status = status,
            )
        
        messages.success(request,"Application has send successfully")
    
    return render(request,'hospital/hospital-view.html',{"view":view})


def rejected_donors(request):
    donor = OrganapplicationModels.objects.filter(issued_status = "rejected")
    return render(request,'hospital/hospital-rejected.html',{'donor':donor})