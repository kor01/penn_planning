function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);

gx = double(gx);
gy = double(gy);

%%% All of your code should be between the two lines of stars.
% *******************************************************************
route = zeros(max_its, 2);

route(1,:) = start_coords;

steps = 1;

step_size = 1;

current = start_coords;

for i = 1:max_its
    
    coord = round(current);
    
    dst = end_coords - current;
    
    if norm(dst) < 2
        break;
    end
    
    steps = steps + 1;

    grad_val_x = gx(coord(2), coord(1));
    grad_val_y = gy(coord(2), coord(1));
    
    grad_val = [grad_val_x, grad_val_y];
    
    grad_norm = norm(grad_val);
    
    grad_val = grad_val / grad_norm;
    
    current = current + grad_val * step_size;
    
    route(steps, :) = current;
    
% *******************************************************************
end

route = route(1:steps, :);

end
