from django.shortcuts import render
from app1.forms import it_sales_form
from app1.models import Employee,Temp
import random

def index(request):
    name = "INDEX:"
    var = random.randint(1,1000)
    context = {'var':var,'name':name}
    return render(request,'app1/index.html',context)

def check(request):
    name = "CHECK:"
    var = random.randint(1,1000)
    context = {'var':var,'name':name}
    return render(request,'app1/check.html',context)

def register(request):
    if request.method == 'POST':
        form = it_sales_form(request.POST)
        print()
        print(form.is_valid())
        print(type(request.POST))
        print()

        if form.is_valid():
            emp_id = request.POST['emp_id']
            name = request.POST['name']
            password = request.POST['password']
            email = request.POST['email']
            dept = request.POST['dept']
            ques_1_id = request.POST['ques_1_id']
            ans_1 = request.POST['ans_1']
            ques_2_id = request.POST['ques_2_id']
            ans_2 = request.POST['ans_2']
            gender = request.POST['gender']
            phone = request.POST['phone']
            repeat_password = request.POST['repeat_password']

            print(emp_id,name,password,email,dept,ques_1_id,ans_1,ques_2_id,ans_2,gender,phone,repeat_password)
            count = 0
            message = ""

            searchObject = Employee.objects.all()
            flag = 1
            for i in range(len(searchObject)):
                lst = str(searchObject[i]).split(";")
                print(lst[0],emp_id)
                if lst[0] == emp_id:
                    message = message + "Employee already exists.\n"
                    flag = 0
                    break
            if flag == 1:
                count = count + 1    
            
            if password == repeat_password:
                if len(password)>6:
                    flag1,flag2,flag3 = 0,0,0
                    for i in range(len(password)):
                        ele = ord(password[i])
                        if ele>96 and ele<123:
                            flag1 = 1
                        elif ele>47 and ele<58:
                            flag2 = 1
                        elif ele>64 and ele<91:
                            flag3 = 1

                    if flag1 == 1 and flag2 == 1 and flag3 == 1:
                        count = count + 1
                    else:
                        message = message +"Re-enter the Password\n"
            else:
                message = message + "Passwords does not match\n"
            
            print(count)
            if count == 2:
                Employee(emp_id = emp_id,
                name = name,
                password = password,
                email = email,
                dept = dept,
                ques_1_id = ques_1_id,
                ans_1 = ans_1,
                ques_2_id = ques_2_id,
                ans_2 = ans_2,
                gender = gender,
                phone = phone).save()
                
                message = message + "Account Successfully Created."
            print(message)
            context = {'message': message}  
            return render(request,'app1/register.html',context)

    else:
        message = "hi"
        context = {"message":message}
        return render(request,'app1/register.html',context)



def login(request):
    return render(request,'app1/login.html')

def test(request):
    if request.method == 'POST':
        form = it_sales_form(request.POST)
        #context = {'form':form}
        print(form.is_valid())
        if form.is_valid():

            Temp(temp_id = request.POST.get('temp_id',False),
                name = request.POST.get('name',False)).save()

            #data = request.POST['var']
            #print("DATA",data)
            print("FORM:",form)
            #context = {'form':form}
            return render(request,'app1/test.html')
    '''
    else:
       
        form = it_sales_form()
    
        return render(request,'app1/test.html')
    '''

# Create your views here.
