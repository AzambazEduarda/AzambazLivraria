<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Compralivro"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="cabecalho.jsp" %>
<%
if(request.getParameter("id")==null){
    response.sendRedirect("index.jsp");
    return;
}

Integer id= Integer.parseInt(request.getParameter("id"));
LivroDAO dao = new LivroDAO();
Livro l = dao.buscarPorChavePrimaria(id);
List<Compralivro> carrinho;
Compralivro cl = new Compralivro();
cl.setLivro(l);
cl.setValorunitario(l.getPreco());
cl.setQtdade(1);
if(session.getAttribute("carrinho")!=null)
{
    carrinho = (List<Compralivro>)session.getAttribute("carrinho");
    carrinho.add(cl);
}
else
{
    carrinho = new ArrayList<Compralivro>();
    carrinho.add(cl);
}
session.setAttribute("carrinho", carrinho);
%>

<!-- util : ; { ""-->
<div class="colorlib-shop">
    <div class="container">
        <div class="row row-pb-md">
            <div class="col-md-10 col-md-offset-1">
                <div class="process-wrap">
                    <div class="process text-center active">
                        <p><span>01</span></p>
                        <h3>Carrinho de compras</h3>
                    </div>
                    <div class="process text-center">
                        <p><span>02</span></p>
                        <h3>Confira</h3>
                    </div>
                    <div class="process text-center">
                        <p><span>03</span></p>
                        <h3>Pedido completo</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-pb-md">
            <div class="col-md-10 col-md-offset-1">
                <div class="product-name">
                    <div class="one-forth text-center">
                        <span>Detalhes do produto</span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Preço</span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Quantidade</span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Total</span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Remover</span>
                    </div>
                </div>
                <% for (Compralivro obj: carrinho)
                {
                    
                %>
                <div class="product-cart">
                    <div class="one-forth">
                        <div class="product-img" style="background-image: url(images/item-6.jpg);">
                        </div>
                        <div class="display-tc">
                            <h3><%=cl.getLivro().getNome()%></h3>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price"><%=cl.getLivro().getPreco()%></span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <span class="price"><%=cl.getLivro().getPreco()%></span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <a href="#" class="closed"></a>
                        </div>
                    </div>
                </div>
                <% }
                %>

                <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="total-wrap">
                    <div class="row">
                        <div class="col-md-8">
                            <form action="login.jsp">
                                <div class="row form-group">                                  
                                    <div class="col-md-3">
                                        <input type="submit" value="Concluir compra" class="btn btn-primary">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3 col-md-push-1 text-center">
                            <div class="total">
                                
                                <div class="grand-total">
                                    <p><span><strong>Total:</strong></span> <span>$450.00</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape.jsp" %>