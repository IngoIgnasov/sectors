package com.project.sectors.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "sector")
public class Sector {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;
}