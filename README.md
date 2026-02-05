# gravitycranker

An alternative server that handles the Paypal ID authentication for GravityBox. Useful for older devices like KitKat where the auth server is now down.

## How to run

```
luvit main
```

Now, it is exposed with port 80. Using AdAway (4.3.6 recommended for legacy support) or traditional /etc/hosts mod, redirect gravitybox.ceco.sk.eu.org to the machine IP address. Then, use `YES` for the PayPal transaction ID. If you intend to, you can add code on top that actually asks Paypal API to see if the transaction is valid.
