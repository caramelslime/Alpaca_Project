package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Auction;

@Repository
public class AuctionDaoImpl implements AuctionDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Auction auction) {
		return sst.insert("auctionns.insert",auction);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("auctionns.getMaxNum");
	}

	@Override
	public int getTotal(Auction auction) {
		return sst.selectOne("auctionns.getTotal",auction);
	}

	@Override
	public List<Auction> list(Auction auction) {
		return sst.selectList("auctionns.list",auction);
	}

	@Override
	public void increaseViewCount(int auction_no) {
		sst.update("auctionns.increaseViewCount",auction_no);
	}

	@Override
	public Auction select(int auction_no) {
		// TODO Auto-generated method stub
		return sst.selectOne("auctionns.select",auction_no);
	}
}