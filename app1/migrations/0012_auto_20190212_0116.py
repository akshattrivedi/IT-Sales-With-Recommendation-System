# Generated by Django 2.1.5 on 2019-02-11 19:46

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app1', '0011_auto_20190212_0104'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transactions',
            name='dateTime',
            field=models.DateTimeField(default=datetime.datetime(2019, 2, 12, 1, 16, 21, 188906)),
        ),
    ]