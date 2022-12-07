package com.project.sectors.model;

import com.project.sectors.repository.SectorGroupRepository;
import lombok.Data;
import lombok.Getter;
import org.hibernate.annotations.Cascade;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;
import javax.persistence.*;
import java.util.List;

@Getter
@Data
@Entity
@Table(name = "sector_group")
public class SectorGroup {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "parent_group_id")
    private Long parentGroupId;

    @OneToMany
    @JoinColumn(name = "group_id")
    private List<Sector> sectors;

    @OneToMany(mappedBy = "parentGroupId",
            fetch=FetchType.EAGER,
            cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    private List<SectorGroup> subGroups;
}