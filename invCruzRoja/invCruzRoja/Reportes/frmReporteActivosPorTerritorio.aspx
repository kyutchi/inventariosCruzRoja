﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReporteActivosPorTerritorio.aspx.cs" Inherits="invCruzRoja.Reportes.frmReporteActivosPorTerritorio" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Reporte de Activos por Territorios</title>
</head>

<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container-fluid">
                        <ul class="nav navbar-nav">
                            <li><a href="../Home">Inicio</a></li>
                            <li><a href="../Home/About">Acerca de</a></li>
                            <li><a href="../Home/Contact">Contacto</a></li>

                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Inventarios <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="../Inventarios">Inventarios</a></li>
                                    <li><a href="../Empleados">Empleados</a></li>
                                    <li><a href="../Territorios">Territorios</a></li>
                                    <li><a href="../Personas">Personas</a></li>
                                    <li><a href="../ReportesI">Reportes</a></li>
                                </ul>
                            </li>
                           <!-- <li><a href="../Home">Cerrar Sesión</a></li> -->
                            <li><asp:Button type="button" class="btnLogout" ID="Button1" runat="server" Text="Cerrar Sesión" OnClick="Button1_Click" Style="background-color:#1e1e1e; border: none; margin-top:13%; color:whitesmoke;" /></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class="container" style="margin-top: 5%">
            <div class="row>">
                <div class="col-md-12">
                    <h2 class="text-center">Reporte de Activos por Territorio</h2>
                    <br />
                    <br />
                    <h4>Buscar registro por:</h4>
                    <div class="col-md-4">
                        <asp:Label ID="lblcomite" runat="server" Text="Nombre del Comité"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtComite" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtProvincia" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblTipo" runat="server" Text="Tipo de Activo"></asp:Label>
                        <asp:TextBox class="form-control" ID="txtTipo" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <br />
                        <asp:Button class="btn btn-primary btn-md" ID="btnFiltrar" runat="server" Text="Filtrar registros" OnClick="btnFiltrar_Click" />
                    </div>
                    <br />
                    <br />
                    <br />
                    <asp:ScriptManager ID="scmTerritorios" runat="server">
                    </asp:ScriptManager>
                    <hr />
                    <asp:Button class="btn btn-info btn-lg" ID="btnGenerarReporte" runat="server" Text="Mostrar Reporte General" OnClick="btnGenerarReporte_Click" />
                    <hr />
                    <asp:Label ID="lblResultado" runat="server"></asp:Label>
                    <rsweb:ReportViewer ID="rvActivosTerritorios" runat="server" Width="100%" Height="577px"></rsweb:ReportViewer>
                </div>
            </div>
            <footer>
            <hr />
            <div class="col-md-10">
                <br />
                 <p>@ 2018 - Sistema de Inventarios de la Cruz Roja Costarricense</p>
            </div>
            <div class="col-md-2">
                <img src="../fonts/logoCRw2.png" style="width:70px; height:70px;" />
            </div>
        </footer>
        </div>
    </form>
</body>
</html>
