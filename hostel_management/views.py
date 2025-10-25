from django.shortcuts import render

# Create your views here.

def landing(request):
    return render(request, 'landing.html')

def adminregister(request):
    return render(request, 'adminregister.html')

def apply(request):
    return render(request, 'apply.html')

def attached(request):
    return render(request, 'attached.html')

def attached_ac(request):
    return render(request, 'attached_ac.html')

def common(request):
    return render(request, 'common.html')

def inchargedash(request):
    return render(request, 'inchargedash.html')

def inchargegrivance(request):
    return render(request, 'inchargegrivance.html')

def inchargelogin(request):
    return render(request, 'inchargelogin.html')

def inchargenotice(request):
    return render(request, 'inchargenotice.html')

def landbackup(request):
    return render(request, 'landbackup.html')

def log(request):
    return render(request, 'log.html')

def manage_rooms(request):
    return render(request, 'manage_rooms.html')

def purchase(request):
    return render(request, 'purchase.html')

def register(request):
    return render(request, 'register.html')

def roomallot(request):
    return render(request, 'roomallot.html')

def stdgrivence(request):
    return render(request, 'stdgrivence.html')

def stdnotice(request):
    return render(request, 'stdnotice.html')

def studentdash(request):
    return render(request, 'studentdash.html')

def verify(request):
    return render(request, 'verify.html')
