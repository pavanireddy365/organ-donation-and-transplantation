from django.db import models
from datetime import datetime
from django.core.files import File

# Create your models here.
class RegistrationModels(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    father = models.CharField(max_length=50)
    email  = models.EmailField()
    phone = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    dob = models.CharField(max_length=50)
    photo = models.ImageField(upload_to='images/', null=True)
    password = models.CharField(max_length=8, null=True)
    gender = models.CharField(max_length=50)
    
    
    class Meta:
        db_table = "User_registration"
        
class OrganapplicationModels(models.Model):
    organ_id = models.AutoField(primary_key=True)
    Name = models.CharField(max_length=50,null=True)
    Father  = models.CharField(max_length=50,null=True)
    Email  = models.EmailField(null=True)
    Phone  = models.CharField(max_length=50,null=True)
    City = models.CharField(max_length=50,null=True)
    Disease = models.CharField(max_length=50,null=True)
    Gender = models.CharField(max_length=50,null=True)
    Date_Of_Birth = models.CharField(max_length=50,null=True)
    Donate_Organ = models.CharField(max_length=50000,null=True)
    status = models.CharField(max_length=50, default='Pending')
    issued_status = models.CharField(max_length=50,default='Not issued')
    date = models.DateField(auto_now_add=True,null=True)
    use = models.ForeignKey(RegistrationModels,on_delete=models.CASCADE,null=True)
    verification_status = models.CharField(max_length=50,default="pending",null=True)
    block1 = models.CharField(max_length=100,null=True)
    block2 = models.CharField(max_length=100,null=True)
    block3 = models.CharField(max_length=100,null=True)


    
    
    # date = models.DateTimeField(auto_now_add=True,null=True)
    # title = models.CharField(max_length=255,null=True)
    # description = models.TextField()
    # def get_date(self):
    #     time = datetime.now()
    #     if self.date.day == time.day:
    #         return str(time.hour - self.date.hour) + " hours ago"
    #     else:
    #         if self.month == time.month:
    #             return str(time.day - self.date.day) + " days ago"
    #     return self.date

    
    class Meta:
        db_table = "Organ_application"
    
class feedbackM(models.Model):
    feedback_id = models.AutoField(primary_key=True)
    feedback2 = models.ForeignKey(RegistrationModels,on_delete=models.CASCADE)
    overall = models.IntegerField(help_text = 'data' , null=True)
    travelling = models.IntegerField(help_text='travelling' ,null=True)
    suggestion = models.CharField(help_text='suggestion' , max_length=400, null=True)
    sentiment = models.CharField(help_text='sentiment', null=True, max_length=80)


    class Meta:
        db_table = "UserFeedback_details"
