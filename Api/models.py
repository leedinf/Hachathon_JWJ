from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

# Create your models here.
class Plant(models.Model):
    nickname=models.CharField(max_length=15)
    image=models.ImageField(upload_to='plant/%Y/%m/')
    species=models.ForeignKey("Species",  on_delete=models.CASCADE)
    interest=models.PositiveSmallIntegerField(default=0)
    humidity = models.IntegerField( validators=[MinValueValidator(0), MaxValueValidator(100)]  )
    watering = models.IntegerField( validators=[MinValueValidator(0)]  )
    def __str__(self):
        return self.nickname
    
class Species(models.Model):
    name= models.CharField(max_length=30)
    def __str__(self):
        return self.name

class Feedback(models.Model):
    plant=models.ForeignKey("Plant",  on_delete=models.CASCADE)
    created_at=models.DateTimeField( auto_now_add=True)
    grow_well=models.BooleanField(default=False, blank=True)
    too_many_bugs=models.BooleanField(default=False, blank=True)
    leaves_dying=models.BooleanField(default=False, blank=True)
    another_problem=models.BooleanField(default=False, blank=True)

