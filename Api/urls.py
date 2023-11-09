from django.urls import path, include

from .views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'plant', PlantViewSet)
router.register(r'species', SpeciesViewSet)
router.register(r'feedback', FeedbackViewSet)
urlpatterns = [
    path('', include(router.urls)),
]
