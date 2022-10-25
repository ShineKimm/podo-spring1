package podo.podospring.repository;

import java.util.List;
import java.util.Optional;
import podo.podospring.dao.Member;

public interface MemberRepository {
    Member save(Member member);
    Optional<Member> findById(Long id);
    Optional<Member> findByName(String name);
    List<Member> findAll();
}