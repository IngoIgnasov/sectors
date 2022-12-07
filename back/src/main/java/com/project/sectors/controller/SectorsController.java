package com.project.sectors.controller;

import com.project.sectors.model.SectorGroup;
import com.project.sectors.service.SectorGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class SectorsController {
    private SectorGroupService sectorGroupService;

    @Autowired
    public SectorsController(SectorGroupService sectorGroupService) {
        this.sectorGroupService = sectorGroupService;
    }

    @GetMapping("/sector_groups")
    Iterable<SectorGroup> all() {
        return sectorGroupService.fetchSectorGroups();
    }


}
