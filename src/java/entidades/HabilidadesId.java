package entidades;
// Generated Mar 5, 2018 4:14:29 PM by Hibernate Tools 4.3.1



/**
 * HabilidadesId generated by hbm2java
 */
public class HabilidadesId  implements java.io.Serializable {


     private int idHabilidad;
     private String nombreHabilidad;

    public HabilidadesId() {
    }

    public HabilidadesId(int idHabilidad, String nombreHabilidad) {
       this.idHabilidad = idHabilidad;
       this.nombreHabilidad = nombreHabilidad;
    }
   
    public int getIdHabilidad() {
        return this.idHabilidad;
    }
    
    public void setIdHabilidad(int idHabilidad) {
        this.idHabilidad = idHabilidad;
    }
    public String getNombreHabilidad() {
        return this.nombreHabilidad;
    }
    
    public void setNombreHabilidad(String nombreHabilidad) {
        this.nombreHabilidad = nombreHabilidad;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof HabilidadesId) ) return false;
		 HabilidadesId castOther = ( HabilidadesId ) other; 
         
		 return (this.getIdHabilidad()==castOther.getIdHabilidad())
 && ( (this.getNombreHabilidad()==castOther.getNombreHabilidad()) || ( this.getNombreHabilidad()!=null && castOther.getNombreHabilidad()!=null && this.getNombreHabilidad().equals(castOther.getNombreHabilidad()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdHabilidad();
         result = 37 * result + ( getNombreHabilidad() == null ? 0 : this.getNombreHabilidad().hashCode() );
         return result;
   }   


}

