from django.db import models
from datetime import datetime
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
        return self.emp_id+";"+self.name+";"+self.gender+";"+self.email+";"+self.password+";"+self.dept+";"+self.phone+";"+self.ques_1_id+";"+self.ans_1+";"+self.ques_2_id+";"+self.ans_2

class Company(models.Model):
    cId = models.CharField(primary_key=True,max_length=50)
    cName = models.CharField(max_length=50)
    cPass = models.CharField(max_length=50)
    cEmail = models.EmailField(max_length=50)
    cType = models.CharField(max_length=50)
    cSize = models.IntegerField()
    cLoc = models.CharField(max_length=50)

    def __str__(self):
        return self.cId+";"+self.cName+";"+self.cPass+";"+self.cEmail+";"+self.cType+";"+str(self.cSize)+";"+self.cLoc

class Products(models.Model):
    pId = models.CharField(primary_key=True,max_length=50)
    pName = models.CharField(max_length=50)
    pPrize = models.IntegerField()

    def __str__(self):
        return str(self.pId)+";"+str(self.pName)+";"+str(self.pPrize)

class Transactions(models.Model):
    tId = models.CharField(primary_key=True,max_length=50)
    amt = models.IntegerField()
    dateTime = models.DateTimeField(auto_now=True)
    remarks = models.CharField(max_length=50)

    def __str__(self):
        return str(self.tId)+";"+str(self.amt)+";"+str(self.dateTime)+";"+str(self.remarks)

class TCP(models.Model): 
    #Connection between Company,Products they bought, and their transaction in a month
    cId = models.ForeignKey(Company,db_column="cId",on_delete=models.CASCADE)
    pId = models.ForeignKey(Products,db_column="pId",on_delete=models.CASCADE)
    tId = models.ForeignKey(Transactions,db_column="tId",on_delete=models.CASCADE)
    qty = models.IntegerField()
    
    def __str__(self):
        return str(self.cId)+";"+str(self.pId)+";"+str(self.tId)+";"+str(self.qty)


class Temp(models.Model):
    temp_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    def __str__(self):
        return str(self.temp_id)+" "+self.name+" "


