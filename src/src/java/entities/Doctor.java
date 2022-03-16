package entities;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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