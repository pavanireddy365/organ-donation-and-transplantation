from django.db import models

# Create your models here.
class HospitalregistratedModels(models.Model):
    register_id = models.AutoField(primary_key=True)
    Name = models.CharField(max_length=100)
    Gender = models.CharField(max_length=50)
    Date_Of_Birth = models.CharField(max_length=50)
    Donate_Organ = models.CharField(max_length=50000)
    Disease = models.CharField(max_length=50)
    Email  = models.EmailField()
    status = models.CharField(max_length=50)
    
    
    class Meta:
        db_table = "Hospital_registration"
