# Generated by Django 2.1.5 on 2019-02-11 18:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app1', '0008_auto_20190209_1517'),
    ]

    operations = [
        migrations.CreateModel(
            name='Company',
            fields=[
                ('cId', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('cName', models.CharField(max_length=50)),
                ('cPass', models.CharField(max_length=50)),
                ('cEmail', models.EmailField(max_length=50)),
                ('cType', models.CharField(max_length=50)),
                ('cSize', models.IntegerField()),
                ('cLoc', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Products',
            fields=[
                ('pId', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('pName', models.CharField(max_length=50)),
                ('pPrize', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='TCP',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qty', models.IntegerField()),
                ('cId', models.ForeignKey(db_column='cId', on_delete=django.db.models.deletion.CASCADE, to='app1.Company')),
                ('pId', models.ForeignKey(db_column='pId', on_delete=django.db.models.deletion.CASCADE, to='app1.Products')),
            ],
        ),
        migrations.CreateModel(
            name='Transactions',
            fields=[
                ('tId', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('amt', models.IntegerField()),
                ('dateTime', models.DateTimeField(auto_now=True)),
                ('remarks', models.CharField(max_length=50)),
            ],
        ),
        migrations.AddField(
            model_name='tcp',
            name='tId',
            field=models.ForeignKey(db_column='tId', on_delete=django.db.models.deletion.CASCADE, to='app1.Transactions'),
        ),
    ]
