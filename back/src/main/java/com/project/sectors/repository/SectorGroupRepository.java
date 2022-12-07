package com.project.sectors.repository;

import com.project.sectors.model.SectorGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SectorGroupRepository extends JpaRepository<SectorGroup, Long> {
    public List<SectorGroup> findByParentGroupIdIsNull();
}
