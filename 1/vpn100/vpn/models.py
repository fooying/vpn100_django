# coding: utf-8
from django.db import models
from django.contrib.auth.models import User

class VPN(models.Model):
	vpnid = models.IntegerField()
	
	VpnName = models.CharField(
		max_length=225,
    )
	url = models.CharField(
		max_length=225,
	)
	
	def __str__(self): 
		return self.VpnName.encode('utf-8')
	
class Oders(models.Model):
    LEVEL_CHOICES = enumerate((
        'NO', 'YES'
    ))

    user = models.ForeignKey(
        User,
    )

    key = models.CharField(
        max_length=40,
        blank=True,
        db_index=True,
        unique=True,
    )

    oder = models.SmallIntegerField(
        choices=LEVEL_CHOICES,
        default=0,
    )

	
    vpn = models.ForeignKey(
        VPN,
    )



    created_at = models.DateTimeField(
    )

    finadate = models.DateTimeField(
    )
	
    num = models.IntegerField(
    )

