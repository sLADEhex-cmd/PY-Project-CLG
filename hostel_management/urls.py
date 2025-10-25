from django.urls import path
from . import views

urlpatterns = [
    path('', views.landing, name='landing'),
    path('adminregister/', views.adminregister, name='adminregister'),
    path('apply/', views.apply, name='apply'),
    path('attached/', views.attached, name='attached'),
    path('attached_ac/', views.attached_ac, name='attached_ac'),
    path('common/', views.common, name='common'),
    path('inchargedash/', views.inchargedash, name='inchargedash'),
    path('inchargegrivance/', views.inchargegrivance, name='inchargegrivance'),
    path('inchargelogin/', views.inchargelogin, name='inchargelogin'),
    path('inchargenotice/', views.inchargenotice, name='inchargenotice'),
    path('landbackup/', views.landbackup, name='landbackup'),
    path('log/', views.log, name='log'),
    path('manage_rooms/', views.manage_rooms, name='manage_rooms'),
    path('purchase/', views.purchase, name='purchase'),
    path('register/', views.register, name='register'),
    path('roomallot/', views.roomallot, name='roomallot'),
    path('stdgrivence/', views.stdgrivence, name='stdgrivence'),
    path('stdnotice/', views.stdnotice, name='stdnotice'),
    path('studentdash/', views.studentdash, name='studentdash'),
    path('verify/', views.verify, name='verify'),
]
