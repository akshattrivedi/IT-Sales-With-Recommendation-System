from django.shortcuts import render,redirect
from app1.forms import it_sales_form
from app1.models import Employee,Company,Products,Transactions,TCP,Temp
from simple_aes_cipher import AESCipher, generate_secret_key
import random
pass_phrase = "7GoodLuck7"
secret_key = generate_secret_key(pass_phrase)
cipher = AESCipher(secret_key)
loginUser = ""
loginFlag = False
forgotEmpID = ""

ques1List = ["--","What was your childhood nickname?","In what city did you meet your spouse/significant other?","What is the name of your favorite childhood friend?",
"What is your oldest sibling’s birthday month and year?","What is the middle name of your oldest child?"]

ques2List = ["--","What school did you attend for sixth grade?","What was the name of your first stuffed animal?","In what city does your nearest sibling live?",
"In what city or town was your first job?","Which is the first company you ever worked for?"]

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
        print()
        print(type(request.POST))
        print()

        
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
                    message = message +"Re-enter the Password.\n"
        else:
            message = message + "Passwords does not match.\n"
        
        print(count)
        if count == 2:
            raw_text = password
            encrypt_text = cipher.encrypt(raw_text)
            Employee(emp_id = emp_id,
            name = name,
            password = encrypt_text,
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
        message = "Welcome To Registration Page"
        context = {"message":message}
        return render(request,'app1/register.html',context)



def login(request):
    global loginFlag,loginUser
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        print(username,password)
        message = ""

        if len(Employee.objects.filter(emp_id=username)) == 0:
            message = message + "No Matching Accounts Found"
        else:
            pass_hash = str(Employee.objects.filter(emp_id=username)[0]).split(";")[4] 
            decrypt_text = cipher.decrypt(pass_hash)
            if password == decrypt_text:
                message = message + "Welcome to the Home Page"
                loginFlag = True
                loginUser = username
                print(loginUser)
                return redirect('home')
            else:
                message = message + "Wrong Password Entered"

        print(message)
        context = {"message":message}
        return render(request,'app1/login.html',context)

    else:
        return render(request,'app1/login.html')
    
def home(request):
    global loginFlag,loginUser
    if loginFlag == False:
        return redirect('login')

    loginObj = str(Employee.objects.filter(emp_id=loginUser)[0]).split(";")
    name = loginObj[1]
    print("Name:",name)
    dictDisp = {}
    obj = TCP.objects.all()
    for i in range(len(obj)):
        val = str(obj[i]).split(";")
        if val[1] in dictDisp :
            if val[8] not in dictDisp[val[1]]:
                dictDisp[val[1]].append(val[8])
        else:
            dictDisp.update({val[1] : [val[8]] })
    print(dictDisp)
    context = {"name":name,"dictDisp":dictDisp}
    return render(request,'app1/home.html',context)

def logout(request):
    global loginFlag,loginUser
    loginFlag = False
    loginUser = ""
    print("After Logout:",loginFlag,loginUser)
    return redirect('login')

def accountUpdate(request):
    global loginUser
    message = ""
    print("Login Flag:",loginFlag)
    if loginFlag == False:
        return redirect('login')

    loginObj = str(Employee.objects.filter(emp_id=loginUser)[0]).split(";")

    if request.method == 'POST':
        dept = request.POST['dept']
        contact = request.POST['contact']
        ans1ID = request.POST['ans1ID']
        ans1 = request.POST['ans1']
        ans2ID = request.POST['ans2ID']
        ans2 = request.POST['ans2']
        email = request.POST['email']
        oldpass = request.POST['oldpass']
        newpass = request.POST['newpass']
        confnewpass = request.POST['confnewpass']

        if oldpass == "" or newpass == "" or confnewpass == "":
            Employee(emp_id=loginUser,name=loginObj[1],password=loginObj[4],dept=dept,phone=contact,
            ques_1_id=ans1ID,ans_1=ans1,ques_2_id=ans2ID,ans_2=ans2,email=email,gender=loginObj[2]).save()
            message = message + "Account Updated Successfully.\n"
        else:
            oldpassDB = cipher.decrypt(loginObj[4])
            if oldpass == oldpassDB:
                if newpass == confnewpass:
                    if len(newpass)>6:
                        flag1,flag2,flag3 = 0,0,0
                        for i in range(len(newpass)):
                            ele = ord(newpass[i])
                            if ele>96 and ele<123:
                                flag1 = 1
                            elif ele>47 and ele<58:
                                flag2 = 1
                            elif ele>64 and ele<91:
                                flag3 = 1
                        if flag1 == 1 and flag2 == 1 and flag3 == 1:
                            encrpytPass = cipher.encrypt(newpass)
                            Employee(emp_id=loginUser,name=loginObj[1],password=encrpytPass,dept=dept,phone=contact,
                            ques_1_id=ans1ID,ans_1=ans1,ques_2_id=ans2ID,ans_2=ans2,email=email,gender=loginObj[2]).save()
                            message = message + "Account Updated Successfully.\n"
                        else:
                            message = message +"Re-enter The Password. Does'nt Follow Password Constraints.\n"
                    else:
                        message = message + "Password Length is less than 7 Characters."
                else:
                    message = message + "New Passwords Does Not Match."
            else:
                message = message + "Old Password Does Not Match."

        loginObj = str(Employee.objects.filter(emp_id=loginUser)[0]).split(";")

        context = {"empID":loginObj[0],"name":loginObj[1],"dept":loginObj[5],"contact":loginObj[6],"gender":loginObj[2],"ans1":loginObj[8],
        "ans1ID":ques1List[int(loginObj[7])],"ans2":loginObj[10],"ans2ID":ques2List[int(loginObj[9])],"email":loginObj[3],"message":message}    
        return render(request,'app1/account-update.html',context)
    else:
        # GET METHOD
        context = {"empID":loginObj[0],"name":loginObj[1],"dept":loginObj[5],"contact":loginObj[6],"gender":loginObj[2],"ans1":loginObj[8],
        "ans1ID":ques1List[int(loginObj[7])],"ans2":loginObj[10],"ans2ID":ques2List[int(loginObj[9])],"email":loginObj[3]}    
        return render(request,'app1/account-update.html',context)

def forgotpass(request):
    global forgotEmpID
    if request.method == "POST":
        forgotEmpID = request.POST['eid']
        if len(Employee.objects.filter(emp_id=forgotEmpID)) == 0:
            message = "No Matching Employee ID Found."
            context = {"message":message}
            return render(request,"app1/forgotpass.html",context)
        
        return redirect("forgotpass2")
    else:
        return render(request,"app1/forgotpass.html")

def forgotpass2(request):
    global forgotEmpID
    message = ""
    if forgotEmpID == "":
        return redirect('forgotpass')

    forgotLst = str(Employee.objects.filter(emp_id=forgotEmpID)[0]).split(";")
    if request.method == "POST":
        email = request.POST['email']
        quesID = request.POST['quesID']
        ans = request.POST['ans']
        psw = request.POST['psw']
        pswRep = request.POST['pswRep']

        if email == forgotLst[3]:
            if (quesID == "1" and ans == forgotLst[8]) or (quesID == "2" and ans == forgotLst[10]):
                if psw == pswRep:
                    if len(psw)>6:
                        flag1,flag2,flag3 = 0,0,0
                        for i in range(len(psw)):
                            ele = ord(psw[i])
                            if ele>96 and ele<123:
                                flag1 = 1
                            elif ele>47 and ele<58:
                                flag2 = 1
                            elif ele>64 and ele<91:
                                flag3 = 1
                        if flag1 == 1 and flag2 == 1 and flag3 == 1:
                            encrpytPass = cipher.encrypt(psw)
                            Employee(emp_id=forgotEmpID,name=forgotLst[1],password=encrpytPass,dept=forgotLst[5],phone=forgotLst[6],
                            ques_1_id=forgotLst[7],ans_1=forgotLst[8],ques_2_id=forgotLst[9],ans_2=forgotLst[10],email=forgotLst[3],gender=forgotLst[2]).save()
                            message =  "Password Updated Successfully."
                        else:
                            message = "Re-enter The Password. Does'nt Follow Password Constraints."
                    else:
                        message = "Password Length is less than 7 Characters."
                else:
                    message = "New Passwords Does Not Match."
            else:
                message = "Question and Answer Does Not Match."
        else:
            message = "Email ID Does Not Match."

        context = {"message":message,"ques1":ques1List[int(forgotLst[7])],"ques2":ques2List[int(forgotLst[9])],"empID":forgotEmpID,"name":forgotLst[1]}
        return render(request,"app1/forgotpass2.html",context)
    else:
        context = {"ques1":ques1List[int(forgotLst[7])],"ques2":ques2List[int(forgotLst[9])],"empID":forgotEmpID,"name":forgotLst[1]}
        return render(request,"app1/forgotpass2.html",context)

def addProduct(request):
    global loginFlag
    message = ""
    if loginFlag == False:
        return redirect('login')

    if request.method == "POST":
        pid = request.POST['pid']
        pname = request.POST['pname']
        pprize = request.POST['cprice']
        if len(Products.objects.filter(pId=pid)) == 0:
            Products(pId=pid,pName=pname,pPrize=pprize).save()
            message = "Added Product Successfully."
        else:
            message = "Product with this product ID already exists."

        context = {'message':message}
        return render(request,'app1/addproduct.html',context)
    else:
        return render(request,'app1/addproduct.html')

def companyRegister(request):
    global loginFlag
    message = ""
    color = "red"
    if loginFlag == False:
        return redirect('login')
    
    if request.method == 'POST':
        cid = request.POST['cid']
        cname = request.POST['cname']
        cpass = request.POST['cpass']
        creppass = request.POST['creppass']
        cemail = request.POST['cemail']
        ctype = request.POST['ctype']
        csize = request.POST['csize']
        cloc = request.POST['cloc']

        if len(Company.objects.filter(cId=cid)) == 0:
            if cpass == creppass:
                if len(cpass)>6:
                    flag1,flag2,flag3 = 0,0,0
                    for i in range(len(cpass)):
                        ele = ord(cpass[i])
                        if ele>96 and ele<123:
                            flag1 = 1
                        elif ele>47 and ele<58:
                            flag2 = 1
                        elif ele>64 and ele<91:
                            flag3 = 1
                    if flag1 == 1 and flag2 == 1 and flag3 == 1:
                        encrpytPass = cipher.encrypt(cpass)
                        Company(cId=cid,cName=cname,cPass=encrpytPass,cEmail=cemail,cType=ctype,cSize=csize,cLoc=cloc).save()
                        message = "Account Registered Successfully."
                        color = "green"
                    else:
                        message = "Re-enter the Password. Does not follow Password Constraints."
                else:
                    message = "Password Length must be greater than 6 characters."
            else:
                message = "Passwords Do Not Match."
        else:
            message = "Company ID Already Exists."

        context = {"message":message,"color":color}
        return render(request,'app1/companyregister.html',context)
    else:
        return render(request,'app1/companyregister.html')

def companyDetails(request):
    # ONLY GET METHOD
    global loginFlag

    if loginFlag == False:
        return redirect('login')

    finalLst = []
    for i in range(len(Company.objects.all())):
        finalLst.append(str(Company.objects.all()[i]).split(";"))
    
    context = {"finalLst":finalLst}
    return render(request,'app1/companydetails.html',context)

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
    
    else:
       
        form = it_sales_form()
    
        return render(request,'app1/test.html')
# Create your views here.
# REDIRECT = redirects to the URL.
# RENDER = renders to the file where there is an HTML page inside a directory.
