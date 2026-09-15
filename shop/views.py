from django.shortcuts import render, get_object_or_404, redirect
from .models import Product

def product_list(request):
    products = Product.objects.all()
    return render(request, 'shop/product_list.html', {'products': products})

def product_detail(request, pk):
    product = get_object_or_404(Product, pk=pk)
    return render(request, 'shop/product_detail.html', {'product': product})

def cart_add(request, pk):
    cart = request.session.get('cart', {})
    cart[str(pk)] = cart.get(str(pk), 0) + 1
    request.session['cart'] = cart
    return redirect('cart_detail')

def cart_detail(request):
    cart = request.session.get('cart', {})
    items = []
    total = 0
    for pid, qty in cart.items():
        try:
            p = Product.objects.get(pk=pid)
        except Product.DoesNotExist:
            continue
        subtotal = p.price * qty
        items.append({'product': p, 'quantity': qty, 'subtotal': subtotal})
        total += subtotal
    return render(request, 'shop/cart.html', {'items': items, 'total': total})

def checkout(request):
    if request.method == 'POST':
        # محاكاة الدفع: نُفرغ السلة
        request.session['cart'] = {}
        return render(request, 'shop/checkout.html', {'success': True})
    return render(request, 'shop/checkout.html')
