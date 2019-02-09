from django.db import models

# Create your models here

class Employee(models.Model):
    emp_id = models.CharField(primary_key=True,max_length=50)
    name = models.CharField(max_length=50)
    gender = models.CharField(max_length=50,default="None")
    email = models.EmailField(max_length=50)
    password = models.CharField(max_length=50,help_text="Minimum of 8 Characters")
    dept = models.CharField(max_length=50)
    phone = models.CharField(max_length=20)
    ques_1_id = models.CharField(max_length=5)
    ans_1 = models.CharField(max_length=50)
    ques_2_id = models.CharField(max_length=5)
    ans_2 = models.CharField(max_length=50)

    def __str__(self):
        return self.emp_id+";"+self.name+";"+self.gender+";"+self.email+";"+self.password+";"+self.dept+";"+self.phone+";"+str(self.ques_1_id)+";"+self.ans_1+";"+str(self.ques_2_id)+";"+self.ans_2

class Temp(models.Model):
    temp_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    def __str__(self):
        return str(self.temp_id)+" "+self.name+" "

