<%-- 
    Document   : datosEmpresa
    Created on : Mar 24, 2018, 10:07:24 AM
    Author     : pc
--%>

<%@page import="entidades.Puestos"%>
<%@page import="entidades.Oferente"%>
<%@page import="entidades.Especializacion"%>
<%@page import="entidades.Area_Trabajo"%>
<%@page import="logica.model"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entidades.Empresa" %>
<%@ page import="entidades.Caracteristicas" %>

<!DOCTYPE html>
<html>
<head>
 <title>Empresa</title>
 <link href="css/principal.css" rel="stylesheet" type="text/css"/>  
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link href="css/datosEmpresa.css" rel="stylesheet" type="text/css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
</head>

    
    
<jsp:useBean id="empresa" scope="session" type="Empresa" />



<div style= 'background-image:  url("images/wallpaper.jpg"); height: 100px; width: 2300px;' > 
 </div>

<div class = "datOf" style=" float:left; display:inline-block; vertical-align:top; ">
    
   <div  >
       <table style="      left: 0px;
    position: absolute;
    top: 110px;
    width: 270px;" class="tablecarac table-bordered table-sm">

        
        <tr><td>Empresa</td></tr><br><br>
        <tr><td><%=empresa.getNombreEmp() %></td></tr><br><br>
        <tr><td><%=empresa.getDescripcionEmp() %></td></tr><br><br>
        <tr><td><%=empresa.getCorreoEmp() %></td></tr>
        <tr><td><%=empresa.getTelefono() %></td></tr>
        <div class = "map" style="  width: 270px; height: 100px;top: 80px; "  >
            <div id = "map" style="  width: 270px; height: 100px; top: 80px; "></div>
        </div><br>
    </table>
    
      
    
   </div>
        
        
  <br>
    
    
    
 <style>          
          #map { 
            height: 100px;    
            width: 270px;            
          }          
        </style> 
        

<script type="text/javascript">
        var map;
        
        function initMap() {                            
            var latitude = <%=empresa.getLongitud() %>; // YOUR LATITUDE VALUE
            var longitude = <%=empresa.getLatitud() %>; // YOUR LONGITUDE VALUE
            
            var myLatLng = {lat: latitude, lng: longitude};
            
            map = new google.maps.Map(document.getElementById('map'), {
              center: myLatLng,
              zoom: 16,
              disableDoubleClickZoom: true, // disable the default map zoom on double click
            });
            
            // Update lat/long value of div when anywhere in the map is clicked    
            google.maps.event.addListener(map,'dragend',function(event) {                
                 document.getElementById('latclicked').value = event.latLng.lat();
                  document.getElementById('longclicked').value =  event.latLng.lng();
            });
            
            // Update lat/long value of div when you move the mouse over the map
            /*google.maps.event.addListener(map,'mousemove',function(event) {
                document.getElementById('latmoved').innerHTML = event.latLng.lat();
                document.getElementById('longmoved').innerHTML = event.latLng.lng();
            });*/
                    
            var marker = new google.maps.Marker({
              position: myLatLng,
              map: map,
              draggable: false,
              //title: 'Hello World'
              
              // setting latitude & longitude as title of the marker
              // title is shown when you hover over the marker
              title: latitude + ', ' + longitude 
            });    
            
         
        }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBrXs6HgONS-8MYrHKdnSFs3VQBbt5EYaA&callback=initMap"
        async defer></script>
        
      
        
        
               <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js" type="text/javascript"></script>
        <script type="text/javascript"> 
       
       $(function(){
    var $caracteristica = $('#caracteristicas');
    var $caracteristicaenarea = $('#aux');
    function onChange() {
        $caracteristicaenarea.val($caracteristica.val());
    };
    $('#caracteristicas')
        .change(onChange)
        .keyup(onChange);
});



  </script>

        
 <style>::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
    color: grey;
    opacity: 1; /* Firefox */
} </style>
        
 
    
        
        <%  List<Caracteristicas> c = model.instance().getAllCaracteristicas(); %>
        
       <br>  <form action="agregarPuesto"  id="formpuesto"  method="POST" class="fem">
                      <legend id="leg" >Agregar nuevo puesto</legend>
                      
                      <div class="form-group">
                      
           <input style="width: 300px;" class="formfield" type="text" name="nombrePuesto" id="nombrePuesto" value="${param.nombrePuesto}" placeholder="Nombre Puesto" required ><br>
           <input style="width: 300px; height: 200px;" class="formfield" type="text" id="descripcionPuesto" name="descripcionPuesto" value="${param.descripcionPuesto}" placeholder="Descripcion" required><br>
           <input style="width: 300px;" class="formfield" type="number" id="salarioPuesto" name="salarioPuesto" value="${param.salarioPuesto}" placeholder="Salario" required><br>
          <input class="formfield" type="hidden" id="nombreempresa" name="nombreempresa" value="<%=empresa.getNombreEmp() %>" placeholder="Salario" required>
            
          <input class="formfield" type="hidden" id="idpu" name="idpu">

          
             <select class="custom-select" name="estado" id="estado">
                 
               <option selected value="true">Estado</option>   
              <option value="true">Publico</option>
              <option value="false">Privado</option>
               </select><br>
              
              
             <select class="custom-select"   name="caracteristicas" id="caracteristicas">
                 
              <option selected value="" selected>Caracteristicas</option>
                 
                <% for(Caracteristicas sc : c){ %>
                
                <option > <%= sc.getNombreCaracteristica()%></option>
                        
                        <% List<Area_Trabajo> at = model.instance().getArea_Trabajo( sc.getNombreCaracteristica());%>
                        <% for(Area_Trabajo artr : at){ %>
                        <option >&#160; <%= artr.getNombreAreaTrabajo()  %></option>
                      <% List<Especializacion> es = model.instance().getEspecializacion(artr.getNombreAreaTrabajo());%>
                       <% for(Especializacion esp : es){ %>
                       <option value="<%= esp.getNombreEspecializacion() %>">&#160;&#160;&#160; <%= esp.getNombreEspecializacion() %></option>
                        
                 <% } %>
                                
               <% } %>
               
           <% } %>
               </select><br>
               
                 
           <input class="formfield" type="hidden" id="aux" name="aux" placeholder="Porcentaje caracteristica" >   
   

           
              <select   style="display: none;" name="id" id="id">
             <option value="<%= empresa.getIdEmp() %>"><%= empresa.getIdEmp() %></option>

                  </select>

               
              <input style="width: 300px;" class="formfield" type="number" id="porcentaje" name="porcentaje" value="${param.porcentaje}" placeholder="Porcentaje caracteristica" ><br>    
              
           
              
              
           <input id="ag" class="formfield" type="submit" value="Agregar Puesto">
           
                      </div>
           
           </form>
              
                     <%
    if(null!=request.getAttribute("error"))
    {
       out.println("Se ha dado el siguiente error... " + request.getAttribute("error") + "...Intente de nuevo"); 
    }
%>
              
            </div>
              
              
              <div class="container" style="display:inline-block; width:200px; height: 540px; ">
  <form action="listarPuestosEmp" method="get" class = "formoferente">
  
  <input type="hidden"  name="idEmp" value="<%=empresa.getIdEmp() %>"><br>
   
 
<input type="submit"  value="Ver Puestos Publicados" >

 </form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script> 
    
    function editar(idpuesto , nombre , descripcion , salario , estado){
    
       
    
         // alert("You have reached the limit of adding  inputs " + idpuesto);
     //     document.getElementById("leg").innerHTML = "Editar puesto";
       //   document.getElementById("ag").value = "Editar";
           document.getElementById("nombPues").value = nombre;
           document.getElementById("nombPu").value = nombre;
           document.getElementById("descri").value = descripcion;
            document.getElementById("salPu").value = salario;
        //    document.getElementById("estado").value = estado;
       //     document.getElementById("caracteristicas").style.display  = "none";
        //    document.getElementById("porcentaje").style.display  = "none";
            document.getElementById("idP").value = idpuesto;
         
         document.getElementById("idPues").value = idpuesto;
            document.getElementById("nombPues").readOnly = "true";
            document.getElementById("descri").readOnly = "true";
          //   $("caracteristicas").toggle();
           //  $("porcentaje").toggle();
           // $("#caracteristicas").hide();
           // $("#porcentaje").hide();
            
            
     //     document.getElementById("formpuesto").action = 'editarpuesto';
       
          document.getElementById("idpu").value = idpuesto;
          
          
           puestos = idpuesto;
    
        $.ajax({type: "POST", 
                  url:"listarPuestosNP", 
                  data: {puestoA: puestos},
                  dataType:"json",
                   
                    success: function(obj){
                  
     
                                   
                   for(var i=0;i<obj.length;i++)
                   {  
                       
                    var input = document.createElement('div');
                    input.id = "nuDiv";
                   
                    var carac = obj[i].nombreEspecializacion;
                   
                    var porcen = obj[i].porcentajeEspecializacion;
                    
                   
          
          input.innerHTML = " <table> <tr> <td style=' padding-right: 80px; text-align: center;'> &#160;&#160;&#160;"  +carac+"</td> <td style=' padding-right: 80px; text-align: center;'>"+porcen+" \n\
\n\
\n\
<img  src='images/pencil.svg'  class='icon' onclick='document.getElementById('myyModal').style.display='block'' style='width:auto;'></td> <tr> </table>";
          document.getElementById("caracDiv").appendChild(input);   
                    
                    
               
            
            
                       
               //      window.alert(obj[i].nombreEspecializacion + " " + obj[i].porcentajeEspecializacion);
                   }
                   },
                  error: function(status){
                         window.alert("Error");
                    }                    
                });         
   
}

 



   function actualizarpuesto(){
       
     
        
         puesto = {
	           nombrePuesto: document.getElementById("nombrePuesto").value,
			//sexo: document.querySelector("input[name='sexo']:checked").value
                    salario: document.getElementById("salarioPuesto").value,
                    descripcionPuesto: document.getElementById("descripcionPuesto").value,
                    estado: document.getElementById("estado").value
      };
          ajax({"method": "POST", 
                  "url":"listarPuestosEmp", 
                  "data": puesto,
                  "success": 
                    function(obj){
                      //  updateList(obj); 
                       // document.getElementById("formulario").reset();
                        window.alert("Actualizada");
                       
                        
                    },
                 
                 "error": function(status){
                         window.alert("Error actualizar");
                    }  
                                   
                });  
        
        
    }
    
    
    var myModal = document.getElementById('myyModal');
    var modalBorrar = document.getElementById('modalBorrar');
    
    window.onclick = function(event) {
   
    
    if (event.target == myModal ) {
        
         
        myModal.style.display = "none";
    }
    
     if (event.target == modalBorrar ) {
        
         
        modalBorrar.style.display = "none";
    }
    
   // $("#nombrePues").val(np);
	
    
}
    

    
    function cerrarModalPuesto(){
    
    
    document.getElementById('myyModal').style.display='none';
   window.location.reload(false);
}



$( "input" ).on( "click", function() {
        
     //   window.alert($( "input:checked" ).val());
            $('#es').val($( "input:checked" ).val());
      
    });
    
    

    
</script>    


 
              
              
               <div id="body" >   
        <div id="listar" class="area" style="width:50%;">   
            
            <jsp:useBean id="puestosListaEmp" scope="request" type="List<Puestos>" class="java.util.ArrayList"/>
            
          

            <table style="overflow-x: auto; width:250px; height: 100px;" class="tablecarac table-bordered table-sm">
              
              <thead style="background-color: slateblue"><tr><td>Nombre</td></tr></thead>
              <tbody style="height: 250px;">
                <% for(Puestos s: puestosListaEmp){ %>
                <tr>
                      <td  onClick="editar('<%= s.getIdPuesto()%>' , '<%= s.getNombrePuesto() %>' , '<%=s.getDescripcionPuesto() %>' , '<%=s.getSalario() %>', '<%=s.isEstado() %>');" ><%= s.getNombrePuesto() %>&#160; <img  src='images/pencil.svg'  class='icon' onclick="document.getElementById('myyModal').style.display='block'" style="width:auto;">
                      <img  onclick="document.getElementById('modalborrar').style.display='block'"  src='images/trashcan.svg'  class='icon'  style="width:auto;">
                      
                      </td>
                     </tr>
               <% } %>
            </tbody>
            </table>
             
      </div>
    </div>
              
              
              </div>
  
  
              <div class="container" style=" float:right; display:inline-block; width:700px; height: 540px;">
                  <%  List<Caracteristicas> cc = model.instance().getAllCaracteristicas(); %>
                  
                  <h1 style="text-align: left; font-size: 150%;">Buscar Oferente </h1>

<form style="float: left;" class = "formempresa"  action="buscarOferente" method="get">
    
     
    <div style="overflow-x: auto; width:250px; height: 89px;">
 <table class="tablecarac table-bordered table-sm">
    
       <% for(Caracteristicas sc : cc){ %>
     <ul>
              <li>
                  
                <a> <%= sc.getNombreCaracteristica()  %> </a>
 
                <ul>
                     
                     <% List<Area_Trabajo> at = model.instance().getArea_Trabajo( sc.getNombreCaracteristica());%>
                    <% for(Area_Trabajo artr : at){ %>
                 <li>
 
                     <a> &#160;&#160;<%= artr.getNombreAreaTrabajo()  %> </a>
         
                     <ul>
                          <% List<Especializacion> es = model.instance().getEspecializacion(artr.getNombreAreaTrabajo());%>
                      <% for(Especializacion esp : es){ %>
                     
                      <li>
 
                           <a > &#160; &#160; <input  type="checkbox" name="names" value="<%= esp.getIdespecializacion()  %>"/> <%= esp.getNombreEspecializacion() %>&#160;&#160;&#160</a>
                          
                           
                       <a> &#160; &#160;    <span style="position:relative;">
                       <input  disabled="disabled" type="number" min="1" max="100" id="porcentaj"  name="porcentaje"   >
                       <div style="position:absolute; left:0; right:0; top:0; bottom:0; cursor: pointer;" ></div>
                        </span> &#160;&#160;&#160</a>
                           
                           
                       </li>

                       <% } %>
                     </ul><br><br>
 
                 </li>
                 
                    <% } %>

                </ul>

              </li>
 
            </ul><br>
     
              <% } %>
 </table>
    </div>
        <input class="formfield"  type="submit" value="Buscar Oferente">
</form>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script>
     
$("div").click(function (evt) {
    $(this).ready().prev("input[disabled]").prop("disabled", false).focus();
});
     
 </script> 
                  
  <div id="body" style="margin: 0 auto; width:85%; display: inline-block; margin-left:20px;">   
        <div id="listar" class="area" style="width:50%;">   
            <br>
            <jsp:useBean id="buscarOferente" scope="request" type="List<Oferente>" class="java.util.ArrayList"/>
            <table class="tablecarac table-bordered table-sm">
              
              <thead style="background-color: slateblue"><tr><td>Nombre</td><td>Apellido</td><td>Correo</td><td>Ubicacion</td><td>Curriculum</td></tr></thead>
              <tbody style="height: 250px;">
                <% for(Oferente s: buscarOferente){ %>
                     <tr><td><%= s.getNombreOferente() %></td><td><%= s.getPrimerApellido() %></td>
                     <td><%= s.getCorreoOferente()  %></td><td><%= s.getUbicacion()  %></td>
                     
              <td><form method="get" action="downloadpdf" enctype="multipart/form-data"> <input type="hidden"  name="cedula" value="<%= s.getCedulaOferente() %>">  <input type="submit" value="Descargar CV" name="download" id="download" /> </form>    </td>
              
              
              <% } %>
            </tbody>
            </table>
      </div>
    </div>
                  
              </div>   
 
 
  <script>
      
     function downloadFile(urlToSend) {
         
         window.alert("en download");
         
     var req = new XMLHttpRequest();
     req.open("GET", urlToSend, true);
     req.responseType = "blob";
     req.onload = function (event) {
         var blob = req.response;
         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
         var link=document.createElement('a');
         link.href=window.URL.createObjectURL(blob);
         link.download=fileName;
         link.click();
     };

     req.send();
 }
      
      
      </script>
           
            
            
            
            
            
   <div  id="myyModal" class="modal">
  
  <form class="modal-content animate" action="editarpuesto" method="POST">
    <div class="imgcontainer">
      <span onclick="cerrarModalPuesto();" class="close" title="Close Modal">&times;</span>
      
    </div>

    <div class="container">
      
     <input class="formfield" type="text" name="nombPues" id="nombPues" ><br>

     
      <input class="formfield" type="text" name="descri" id="descri"><br>
      
     <input class="formfield" type="number" id="salPu" name="salPu"  ><br>
     
     <input class="formfield" type="hidden" id="idP" name="idP"  ><br>
     
     
 <div>
    <input type="radio" name="estad" value="true" id="estad" class="check" checked="checked" >
    <label for="publico">Publico</label>
  </div>
  <div>
    <input type="radio" name="estad" value="false" id="estad" class="check" >
    <label for="privado">Privado</label>
  </div>
     
      <div id="caracDiv"> 
         
        
         <table style="border-spacing: 10px; border-collapse: separate; ">
             <tr>
              <div id="caracDiv">   
             <th>Caracteristica</th>
             <th>Porcentaje</th>
             </tr>
         
         </table>
               
     </div>
     
        
      <button type="submit">Editar</button>
      
    </div>

    
  </form>
</div>  
            
            
    
            
            
            
            
            
            
            
             <div  id="modalborrar" class="modal">
  
  <form class="modal-content animate" action="deletePuesto" method="POST">
    <div class="imgcontainer">
      <span onclick="document.getElementById('modalborrar').style.display='none'" class="close" title="Close Modal">&times;</span>
      
    </div>

    <div class="container">
      
     <input class="formfield" type="text" name="nombPu" id="nombPu" ><br>

     
     
     <input class="formfield" type="hidden" id="idPues" name="idPues"  ><br>
     
        
      <button type="submit">Desactivar</button>
      
    </div>

    
  </form>
</div>  
            
            
            
            
            
   
            
            
            
            
            
            
            
            
       

             
            
<div class = "salir" style="position:fixed ; top:0%; right:0%;">
    <ul class="menu">
        <li><a href="#"><%=empresa.getIdEmp() %>-<%=empresa.getNombreEmp() %><img class="inline" src="images/down.png" alt=""></a>
            <ul class="menuitem" > <li> <a href="Logout">Salir</a></li> </ul>
        </li>
    </ul>
           
         
            
</div>
            
             <a href = "principal.jsp" target = "_self" style="position: fixed;top: 0%;left: 0%;">Regresar</a></center>
            
</body>
</html>
