package entities;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "supervisors")
@PrimaryKeyJoinColumn(name = "user_id" , referencedColumnName = "id")
@DiscriminatorValue("1")
public class Supervisor extends User {
    
    private static final long serialVersionUID = 1L;

    private String fullname;
    private Boolean is_confirmed;
}