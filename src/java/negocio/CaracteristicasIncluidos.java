package negocio;
// Generated Mar 5, 2018 4:14:29 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * CaracteristicasIncluidos generated by hbm2java
 */
public class CaracteristicasIncluidos  implements java.io.Serializable {


     private Integer idCaracteristicaIn;
     private Puestos puestos;
     private Date fechaInclusion;

    public CaracteristicasIncluidos() {
    }

    public CaracteristicasIncluidos(Puestos puestos, Date fechaInclusion) {
       this.puestos = puestos;
       this.fechaInclusion = fechaInclusion;
    }
   
    public Integer getIdCaracteristicaIn() {
        return this.idCaracteristicaIn;
    }
    
    public void setIdCaracteristicaIn(Integer idCaracteristicaIn) {
        this.idCaracteristicaIn = idCaracteristicaIn;
    }
    public Puestos getPuestos() {
        return this.puestos;
    }
    
    public void setPuestos(Puestos puestos) {
        this.puestos = puestos;
    }
    public Date getFechaInclusion() {
        return this.fechaInclusion;
    }
    
    public void setFechaInclusion(Date fechaInclusion) {
        this.fechaInclusion = fechaInclusion;
    }




}


