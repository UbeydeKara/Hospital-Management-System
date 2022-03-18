package entities;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import java.time.LocalDate;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "doctors")
@PrimaryKeyJoinColumn(name = "user_id" , referencedColumnName = "id")
@DiscriminatorValue("2")
public class Doctor extends User {
    
    private static final long serialVersionUID = 1L;
    
    private String specialty;
    private String fullname;
    private String sex;
    private LocalDate birth_date;
    private String city;
    private String phone;
    private String district;
}