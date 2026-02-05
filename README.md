# gravitycranker

An alternative server that handles the Paypal ID authentication for GravityBox. Useful for older devices like KitKat where the auth server is now down.

## How to run

```
luvit main
```

Now, it is exposed with port 80. Using AdAway (4.3.6 recommended for legacy support) or traditional /etc/hosts mod, redirect gravitybox.ceco.sk.eu.org to the machine IP address. Then, use `YES` for the PayPal transaction ID. If you intend to, you can add code on top that actually asks Paypal API to see if the transaction is valid.

## DISCLAIMER

`gravitybox.ceco.sk.eu.org` is no longer up. GravityBox Unlocker is available on Play Store for free, although... Play Store. You'll need GMS to use it.

So, this is just a better solution, especially for those affected by the Google login issue on 4.4 or lower.

This project is not "lets do piracy!!". This is something I've made for personal interest - and from the fact that the project can no longer be paid, even for those who paid for it. (as long as they are not willing to add GMS - which is not privacy friendly at all)
