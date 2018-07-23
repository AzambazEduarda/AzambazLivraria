<%@page import="modelo.Cliente"%>
<%
    if (session.getAttribute("cliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if (session.getAttribute("carrinho") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Cliente cliente = (Cliente) session.getAttribute("cliente");

%>
<%@include file="cabecalho.jsp" %>


<div class="col-md-12">
    <div class="form-group">
        <form method="post"action="#" class="colorlib-form">
            <h2>Dados da Compra</h2>
            <div class="row">

                <div class="form-group">
                    <div class="col-md-6">
                        <label for=fname>Nome do comprador:</label>
                        <%=cliente.getNome()%>
                    </div>
                    <div class="col-md-6">
                        <label for=lname>Endereço de entrega:</label>
                        <%=cliente.getEndereco()%>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="radio">
                        <label><input type="radio" name="optradio">Create an Account? </label>
                        <label><input type="radio" name="optradio"> Ship to different address</label>
                    </div>
                </div>
            </div>
    </div>
</form>
</div>
<div class="col-md-5">
    <div class="cart-detail">
        <h2>Carrinho</h2>
        <ul>
            <li>
                <span>Subtotal</span> <span>$100.00</span>
                <ul>
                    <li><span>1 x Product Name</span> <span>$99.00</span></li>
                    <li><span>1 x Product Name</span> <span>$78.00</span></li>
                </ul>
            </li>
            <li><span>Order Total</span> <span>$180.00</span></li>
        </ul>
    </div>
    <form action="checkout.jsp">
        <div class="row form-group">                                  
            <div class="col-md-3">
                <input type="submit" value="Concluir Compra" class="btn btn-primary">
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-md-12">
            <p><a href="#" class="btn btn-primary">Place an order</a></p>
        </div>
    </div>
</div>
</div>
</div>
</div>

<%@include file="rodape.jsp" %>
