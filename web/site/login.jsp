
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%
    ///se os dois campos forem informados, é login
    if (request.getParameter("txtEmail") != null
            && request.getParameter("txtSenha") != null) {
        ClienteDAO dao = new ClienteDAO();
        Cliente c = dao.logar(request.getParameter("txtEmail"),
                request.getParameter("txtSenha"));
        if (c != null) {
            session.setAttribute("cliente", c);
            response.sendRedirect("checkout.jsp");
            return;
        } else {
%>
<script> alert('login e/ou senha inválidos');
</script>
<%}
    }
    /// Se preencheu o cadastro
    if (request.getParameter("txtNEmail") != null
            && request.getParameter("txtNEnd") != null
            && request.getParameter("txtNSenha") != null
            && request.getParameter("txtNNome") != null);
    {
        ClienteDAO dao = new ClienteDAO();
        Cliente c = new Cliente();
        c.setEmail(request.getParameter("txtNEmail"));
        c.setEndereco(request.getParameter("txtNEnd"));
        c.setSenha(request.getParameter("txtNSenha"));
        c.setNome(request.getParameter("txtNNOme"));
        dao.incluir(c);

        session.setAttribute("cliente", c);
        response.sendRedirect("checkout.jsp");
        return;
}
%>
<%@include file="cabecalho.jsp" %>

<div class="colorlib-shop">
    <div class="container">
        <div class="row row-pb-md">
        </div>
        <div class="row">
            <div class="col-md-6">
                <form method="post"action="#" class="colorlib-form">
                    <h2>Login</h2>
                    <div class="row">

                        <div class="form-group">
                            <div class="col-md-6">
                                <label for="fname">Email</label>
                                <input type="email" id="fname" name="txtEmail" class="form-control" placeholder="Digite seu email">
                            </div>
                            <div class="col-md-6">
                                <label for="lname">Senha</label>
                                <input type="password" id="lname" name="txtSenha" class="form-control" placeholder="Digite sua senha">
                            </div>
                        </div>
                        <form action="checkout.jsp">
                            <div class="row form-group">                                  
                                <div class="col-md-3">
                                    <input type="submit" value="Entrar" class="btn btn-primary">
                                </div>
                            </div>
                        </form>
                    </div>
                </form>
            </div>
            <div class="col-md-6">
                <div class="cart-detail">
                    <form method="post" class="colorlib-form">
                        <h2>Novo Cadastro</h2>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label for="fname">Email</label>
                                    <input type="email" id="fname" name="txtNEmail" class="form-control" placeholder="Digite seu email">
                                </div>
                                <div class="col-md-6">
                                    <label for="lname">Senha</label>
                                    <input type="password" id="lname" name="txtNSenha" class="form-control" placeholder="Digite sua senha">
                                </div>
                                <div class="col-md-6">
                                    <label for="lnme">Nome</label>
                                    <input type="password" id="lname" name="txtNNome" class="form-control" placeholder="Digite sua senha">
                                </div>
                                <div class="col-md-6">
                                    <label for="fend">Endereço</label>
                                    <input type="text" id="fname" name="txtNEnd" class="form-control" placeholder="Digite seu email">
                                </div>
                            </div>
                            <form action="checkout.jsp">
                                <div class="row form-group">                                  
                                    <div class="col-md-3">
                                        <input type="submit" value="Cadastrar" class="btn btn-primary">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape.jsp" %>