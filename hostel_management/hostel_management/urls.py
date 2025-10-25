from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    # This now correctly points to your app's URL configuration
    path('', include('hostel_management.urls')),
]
