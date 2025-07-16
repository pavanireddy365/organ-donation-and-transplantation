"""donate_organ URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as mainapp_views
from userapp import views as userapp_views
from adminapp import views as adminapp_views
from hospitalapp import views as hospital_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # main
    path('admin/', admin.site.urls),
    path('',mainapp_views.main_home,name='main_home'),
    path('main-about',mainapp_views.main_about,name='main_about'),
    path('main-contact',mainapp_views.main_contact,name='main_contact'),
    
    # user
    path('main-registration',userapp_views.main_registration,name='main_registration'),
    path('main-user',userapp_views.main_user,name='main_user'),
    path('user-dashboard',userapp_views.user_dashboard,name='user_dashboard'),
    path('user-donateorgan',userapp_views.user_donateorgan,name='user_donateorgan'),
    path('user-mystatus',userapp_views.user_mystatus,name='user_mystatus'),
    path('user-myprofile',userapp_views.user_myprofile,name='user_myprofile'),
    path('user-myfeedback',userapp_views.user_myfeedback,name='user_myfeedback'),
    path('calculater',userapp_views.calculater,name='calculater'),

    # admin
    path('main-admin',adminapp_views.main_admin,name='main_admin'),
    path('admin-dashboard',adminapp_views.admin_dashboard,name='admin_dashboard'),
    path('admin-pendinguser',adminapp_views.admin_pendinguser,name='admin_pendinguser'),
    path('admin-alluser',adminapp_views.admin_alluser,name='admin_alluser'),
    path('admin-organdonor',adminapp_views.admin_organdonor,name='admin_organdonor'),
    path('admin-deathcertificate',adminapp_views.admin_deathcertificate,name='admin_deathcertificate'),
    path('admin-feedbackanalysis',adminapp_views.admin_feedbackanalysis,name='admin_feedbackanalysis'),
    path('admin-sentimentanalysis',adminapp_views.admin_sentimentanalysis,name='admin_sentimentanalysis'),
    path('issued/<int:organ_id>',adminapp_views.issued,name='issued'),
    path('reject/<int:organ_id>',adminapp_views.reject,name='reject'),
    path('admin-verifyapplication/<int:id>',adminapp_views.verify_application,name="verify_application"),
    
    
    # hospital
    path('main-hospital',hospital_views.main_hospital,name="main_hospital"),
    path('hospital-dashboard',hospital_views.hospital_dasboard,name="hospital_dasboard"),
    path('hospital-registereddonors',hospital_views.hospital_registereddonors,name="hospital_registereddonors"),
    path('hospital-availabledonor',hospital_views.hospital_availabledonor,name="hospital_availabledonor"),
    path('hospital-rejected',hospital_views.rejected_donors,name='rejected_donors'),
    path('hospital-searchbylocation',hospital_views.hospital_searchbylocation,name="hospital_searchbylocation"),
    path('hospital-searchbyorgan',hospital_views.hospital_searchbyorgan,name="hospital_searchbyorgan"),
    path('hospital-view/<int:organ_id>',hospital_views.hospital_view,name="hospital_view"),
    
    
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
