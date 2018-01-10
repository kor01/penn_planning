function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

P1 = [P1 [1 1 1]']';
P2 = [P2 [1 1 1]']';

flag1 = corner_inside(P1, P2);
flag2 = corner_inside(P2, P1);

flag = flag1 || flag2;

% *******************************************************************
end

function flag = corner_inside(P1, P2)

line1 = cross(P1(:, 1), P1(:, 2));
line1 = line1 * dot(line1, P1(:, 3));

line2 = cross(P1(:, 1), P1(:, 3));
line2 = line2 * dot(line2, P1(:, 2));

line3 = cross(P1(:, 2), P1(:, 3));
line3 = line3 * dot(line3, P1(:, 1));

mat = [line1 line2 line3]';

signs = mat * P2;

pred = signs >= 0;

flag = any(all(pred));

end