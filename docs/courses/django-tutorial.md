# Django

[Django docs](https://docs.djangoproject.com/en/5.0/)

[Django Rest Framework docs](https://www.django-rest-framework.org/tutorial/quickstart/)

## General
* Django is used to create static full stack server side website.
* Django rest framework is used to create apis
* Django makes use of the model, view, template design pattern.
* You can use shortcuts from django.shortcuts to cut down on code that gets repeated across multiple projects.
* You can use generic views to replace writing out views in full by hand.

## Creating Django projects
1. Create the project directory
```python
mkdir tutorial
cd tutorial
```

2. Create a virtual environment to isolate our package dependencies locally
```python
python3 -m venv env
source env/bin/activate  # On Windows use `env\Scripts\activate`
```

3. Install Django and Django REST framework into the virtual environment
```python
pip install django
pip install djangorestframework
```

4. Set up a new project with a single application
```python
django-admin startproject tutorial .  # Note the trailing '.' character
cd tutorial
django-admin startapp quickstart
```

## Making model changes
1. Change your models (in models.py).
2. `python manage.py makemigrations` to create migrations for those changes
3. `python manage.py migrate` to apply those changes to the database.

## Runserver 

`python manage.py runserver`

## Admin

* `python manage.py createsuperuser` to create admin account

* Add models to admin panel by using `admin.site.register`:
```py title=polls/admin.py
from django.contrib import admin
from .models import Choice, Question

admin.site.register(Question)
admin.site.register(Choice)
```

# Django REST framework

