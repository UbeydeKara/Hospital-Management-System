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
@Table(name = "patients")
@PrimaryKeyJoinColumn(name = "user_id" , referencedColumnName = "id")
@DiscriminatorValue("3")
public class Patient extends User {
    
    private static final long serialVersionUID = 1L;
    
    private String room;
    private String bed_no;
    private String sex;
    private short age;
    private String address;
    private String phone;
    private short weight;
    private String fullname;
    private String blood_type;
    private String identity_no;
    private String insurance_type;
    private LocalDate birth_date;
    private String birth_place;
    private String father;
    private String mother;
    private String district;
    private String city;
    
}