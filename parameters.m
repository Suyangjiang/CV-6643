
P = zeros(12,12);
for i = 1:6
    j = i*2-1;
    k = i*2;
    for m = 1:3
        P(j,m) = world(i,m);
        P(k,m+4) = world(i,m);
        P(j,m+8) = -world(i,m)*image(i,1);
        P(k,m+8) = -world(i,m)*image(i,2);
        P(j,12) = -image(i,1);
        P(k,12) = -image(i,2);
    end
    P(j,4) = 1.0;
    P(k,8) = 1.0;
end
[U S V] = svd(P);
[min_val, min_index] = min(diag(S(1:12,1:12)));
m = V(1:12, min_index);

M = zeros(3,4);
for i = 1:4
    M(1,i) = m(i,1);
    M(2,i) = m(i+4,1);
    M(3,i) = m(i+8,1);
end

A = M(1:3,1:3);
B = M(1:3,4);
a1 = A(1,1:3);
a2 = A(2,1:3);
a3 = A(3,1:3);
i = -1/norm(a3);
r3 = i*a3;
u0 = i*i*dot(a1,a3);
v0 = i*i*dot(a2,a3);
x = -dot(cross(a1,a3),cross(a2,a3))/(norm(cross(a1,a3))*norm(cross(a2,a3)));
theta = acosd(x);
x = acos(x);
alpha = i*i*(norm(cross(a1,a3)))*sin(x);
beta = i*i*(norm(cross(a2,a3)))*sin(x);
r1 = cross(a2,a3)/norm(cross(a2,a3));
r2 = cross(r3,r1);
R = [r1;r2;r3];
K = [alpha,-alpha*cot(x),u0;0,beta/sin(x),v0;0,0,1];
t = i*inv(K)*B;


%{
bonus part

P = zeros(12,12);
for i = 1:6
    j = i*2-1;
    k = i*2;
    for m = 1:3
        P(j,m) = newworld(i,m);
        P(k,m+4) = newworld(i,m);
        P(j,m+8) = -newworld(i,m)*bonusimage(i,1);
        P(k,m+8) = -newworld(i,m)*bonusimage(i,2);
        P(j,12) = -bonusimage(i,1);
        P(k,12) = -bonusimage(i,2);
    end
    P(j,4) = 1.0;
    P(k,8) = 1.0;
end

[U S V] = svd(P);
[min_val, min_index] = min(diag(S(1:12,1:12)));
m = V(1:12, min_index);

M = zeros(3,4);
for i = 1:4
    M(1,i) = m(i,1);
    M(2,i) = m(i+4,1);
    M(3,i) = m(i+8,1);
end

A = M(1:3,1:3);
B = M(1:3,4);
a1 = A(1,1:3);
a2 = A(2,1:3);
a3 = A(3,1:3);
i = -1/norm(a3);
r3 = i*a3;
u0 = i*i*dot(a1,a3);
v0 = i*i*dot(a2,a3);
x = -dot(cross(a1,a3),cross(a2,a3))/(norm(cross(a1,a3))*norm(cross(a2,a3)));
theta = acosd(x);
x = acos(x);
alpha = i*i*(norm(cross(a1,a3)))*sin(x);
beta = i*i*(norm(cross(a2,a3)))*sin(x);
r1 = cross(a2,a3)/norm(cross(a2,a3));
r2 = cross(r3,r1);
R = [r1;r2;r3];
K = [alpha,-alpha*cot(x),u0;0,beta/sin(x),v0;0,0,1];
t = i*inv(K)*B;

%}