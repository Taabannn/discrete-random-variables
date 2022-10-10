function [ y_pdf ] = L5_2_S2_Multinomial_dist( p, n )
    figure 
    
    x1 = 0:n;
    x2 = 0:n;
    [X1,X2] = meshgrid(x1,x2);
    X3 = n-(X1+X2);
    
    % computing the pdf of the distribution.

    y_pdf = mnpdf([X1(:),X2(:),X3(:)],repmat(p,(n+1)^2,1));
    
    % plot the pdf on a 3-dimensional figure.

    y_pdf = reshape(y_pdf,n+1,n+1);
    bar3(y_pdf)
    h = gca;
    h.XTickLabel = [0:n];
    h.YTickLabel = [0:n];
    xlabel('x_1')
    ylabel('x_2')
    zlabel('Probability Mass')
    title('Multinomial Distribution')

end

