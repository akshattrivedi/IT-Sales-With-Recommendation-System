# Generated by Django 2.1.5 on 2019-02-08 19:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app1', '0004_auto_20190208_1932'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='phone',
            field=models.CharField(max_length=20),
        ),
    ]
