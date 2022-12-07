package com.project.sectors.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "user_data")
public class UserData {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "agreed_to_terms")
    private Boolean agreedToTerms = true;

    @ManyToMany
    @JoinTable(
            name = "user_sector",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "sector_id"))
    private List<Sector> sectors;
}