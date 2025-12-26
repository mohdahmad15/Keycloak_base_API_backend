package com.javademoproject.auditConfig;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

@Configuration
public class AuditingConfig {
    @Bean
    public AuditorAware<String> auditorAware(HttpServletRequest request) {

        return ()->{
            String ip=request.getHeader("x-forwarded-for");
            if(ip==null){
                ip=request.getRemoteAddr();
            }

            return Optional.ofNullable(ip);
        };
    }
}
