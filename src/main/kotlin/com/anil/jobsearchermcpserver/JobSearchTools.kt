package com.anil.jobsearchermcpserver

import org.springaicommunity.mcp.annotation.McpTool
import org.springframework.stereotype.Component
import java.util.logging.Logger

@Component
class JobSearchTools {

    private val logger = Logger.getLogger("JobSearchTools")

    @McpTool(
        name = "anilsjobsearcher-latest-jobs",
        description = "Get current job openings for a given profile"
    )
    public fun getCurrentJobsForProfile(): List<String> {
        var jobList = listOf(
            "Software Engineer at TechCorp",
            "Backend Developer at DevSolutions",
            "Full Stack Developer at WebWorks"
        )
        return jobList
    }
}