from django.shortcuts import render
from rest_framework.response import Response
from django.http import HttpResponse
from rest_framework.views import APIView

class HomeView(APIView):
    def get(self, request):
        return HttpResponse("connected")
