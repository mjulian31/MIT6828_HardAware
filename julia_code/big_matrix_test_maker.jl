using Printf
size1=1024
size2=1024
size3=1024

a = rand(size1, size2)
b = rand(size2, size3)

ans = a*b

@printf("%s %s %s norand\n", size1, size2, size3);
@printf("%s%s\n", a,b);
@printf("%s\n", ans);
