"""it_sales URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
# CALLING URL NAME AND THE FUNCTION IN views.py

from django.urls import path
from app1 import views

urlpatterns = [
    path('',views.index,name='index'),
    path('check',views.check,name='check'),
    path('register',views.register,name='register'),
    path('login',views.login,name='login'),
    path('test',views.test,name='test'),
    path('home',views.home,name='home'),
    path('logout',views.logout,name='logout'),
    path('account-update',views.accountUpdate,name='account-update'),
]
