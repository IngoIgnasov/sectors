package com.project.sectors.service;

import com.project.sectors.model.SectorGroup;
import com.project.sectors.repository.SectorGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SectorGroupService {
    private final SectorGroupRepository sectorGroupRepository;

    @Autowired
    public SectorGroupService(SectorGroupRepository sectorGroupRepository) {
        this.sectorGroupRepository = sectorGroupRepository;
    }

    public List<SectorGroup> fetchSectorGroups() {
        List<SectorGroup> sectorGroups = sectorGroupRepository.findByParentGroupIdIsNull();
        SectorGroup group = sectorGroups.get(0);
        System.out.println(group.getName());
        return sectorGroups;
    }

}
