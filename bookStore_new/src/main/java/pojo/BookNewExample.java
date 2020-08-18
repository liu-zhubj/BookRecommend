package pojo;

import java.util.ArrayList;
import java.util.List;

public class BookNewExample {
    protected String orderByClause;

    protected boolean distinct;
    private Integer limit;
    private Integer offset;

    protected List<Criteria> oredCriteria;

    public BookNewExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andBooknameIsNull() {
            addCriterion("bookname is null");
            return (Criteria) this;
        }

        public Criteria andBooknameIsNotNull() {
            addCriterion("bookname is not null");
            return (Criteria) this;
        }

        public Criteria andBooknameEqualTo(String value) {
            addCriterion("bookname =", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotEqualTo(String value) {
            addCriterion("bookname <>", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameGreaterThan(String value) {
            addCriterion("bookname >", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameGreaterThanOrEqualTo(String value) {
            addCriterion("bookname >=", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLessThan(String value) {
            addCriterion("bookname <", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLessThanOrEqualTo(String value) {
            addCriterion("bookname <=", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLike(String value) {
            addCriterion("bookname like", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotLike(String value) {
            addCriterion("bookname not like", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameIn(List<String> values) {
            addCriterion("bookname in", values, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotIn(List<String> values) {
            addCriterion("bookname not in", values, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameBetween(String value1, String value2) {
            addCriterion("bookname between", value1, value2, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotBetween(String value1, String value2) {
            addCriterion("bookname not between", value1, value2, "bookname");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNull() {
            addCriterion("author is null");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNotNull() {
            addCriterion("author is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorEqualTo(String value) {
            addCriterion("author =", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotEqualTo(String value) {
            addCriterion("author <>", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThan(String value) {
            addCriterion("author >", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThanOrEqualTo(String value) {
            addCriterion("author >=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThan(String value) {
            addCriterion("author <", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThanOrEqualTo(String value) {
            addCriterion("author <=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLike(String value) {
            addCriterion("author like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotLike(String value) {
            addCriterion("author not like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorIn(List<String> values) {
            addCriterion("author in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotIn(List<String> values) {
            addCriterion("author not in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorBetween(String value1, String value2) {
            addCriterion("author between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotBetween(String value1, String value2) {
            addCriterion("author not between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andPublicsourceIsNull() {
            addCriterion("publicSource is null");
            return (Criteria) this;
        }

        public Criteria andPublicsourceIsNotNull() {
            addCriterion("publicSource is not null");
            return (Criteria) this;
        }

        public Criteria andPublicsourceEqualTo(String value) {
            addCriterion("publicSource =", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceNotEqualTo(String value) {
            addCriterion("publicSource <>", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceGreaterThan(String value) {
            addCriterion("publicSource >", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceGreaterThanOrEqualTo(String value) {
            addCriterion("publicSource >=", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceLessThan(String value) {
            addCriterion("publicSource <", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceLessThanOrEqualTo(String value) {
            addCriterion("publicSource <=", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceLike(String value) {
            addCriterion("publicSource like", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceNotLike(String value) {
            addCriterion("publicSource not like", value, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceIn(List<String> values) {
            addCriterion("publicSource in", values, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceNotIn(List<String> values) {
            addCriterion("publicSource not in", values, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceBetween(String value1, String value2) {
            addCriterion("publicSource between", value1, value2, "publicsource");
            return (Criteria) this;
        }

        public Criteria andPublicsourceNotBetween(String value1, String value2) {
            addCriterion("publicSource not between", value1, value2, "publicsource");
            return (Criteria) this;
        }

        public Criteria andTranslatorIsNull() {
            addCriterion("translator is null");
            return (Criteria) this;
        }

        public Criteria andTranslatorIsNotNull() {
            addCriterion("translator is not null");
            return (Criteria) this;
        }

        public Criteria andTranslatorEqualTo(String value) {
            addCriterion("translator =", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorNotEqualTo(String value) {
            addCriterion("translator <>", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorGreaterThan(String value) {
            addCriterion("translator >", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorGreaterThanOrEqualTo(String value) {
            addCriterion("translator >=", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorLessThan(String value) {
            addCriterion("translator <", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorLessThanOrEqualTo(String value) {
            addCriterion("translator <=", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorLike(String value) {
            addCriterion("translator like", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorNotLike(String value) {
            addCriterion("translator not like", value, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorIn(List<String> values) {
            addCriterion("translator in", values, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorNotIn(List<String> values) {
            addCriterion("translator not in", values, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorBetween(String value1, String value2) {
            addCriterion("translator between", value1, value2, "translator");
            return (Criteria) this;
        }

        public Criteria andTranslatorNotBetween(String value1, String value2) {
            addCriterion("translator not between", value1, value2, "translator");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(String value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(String value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(String value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(String value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(String value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(String value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLike(String value) {
            addCriterion("date like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotLike(String value) {
            addCriterion("date not like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<String> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<String> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(String value1, String value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(String value1, String value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andPagesIsNull() {
            addCriterion("pages is null");
            return (Criteria) this;
        }

        public Criteria andPagesIsNotNull() {
            addCriterion("pages is not null");
            return (Criteria) this;
        }

        public Criteria andPagesEqualTo(Integer value) {
            addCriterion("pages =", value, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesNotEqualTo(Integer value) {
            addCriterion("pages <>", value, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesGreaterThan(Integer value) {
            addCriterion("pages >", value, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesGreaterThanOrEqualTo(Integer value) {
            addCriterion("pages >=", value, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesLessThan(Integer value) {
            addCriterion("pages <", value, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesLessThanOrEqualTo(Integer value) {
            addCriterion("pages <=", value, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesIn(List<Integer> values) {
            addCriterion("pages in", values, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesNotIn(List<Integer> values) {
            addCriterion("pages not in", values, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesBetween(Integer value1, Integer value2) {
            addCriterion("pages between", value1, value2, "pages");
            return (Criteria) this;
        }

        public Criteria andPagesNotBetween(Integer value1, Integer value2) {
            addCriterion("pages not between", value1, value2, "pages");
            return (Criteria) this;
        }

        public Criteria andIsbnIsNull() {
            addCriterion("ISBN is null");
            return (Criteria) this;
        }

        public Criteria andIsbnIsNotNull() {
            addCriterion("ISBN is not null");
            return (Criteria) this;
        }

        public Criteria andIsbnEqualTo(String value) {
            addCriterion("ISBN =", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnNotEqualTo(String value) {
            addCriterion("ISBN <>", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnGreaterThan(String value) {
            addCriterion("ISBN >", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnGreaterThanOrEqualTo(String value) {
            addCriterion("ISBN >=", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnLessThan(String value) {
            addCriterion("ISBN <", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnLessThanOrEqualTo(String value) {
            addCriterion("ISBN <=", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnLike(String value) {
            addCriterion("ISBN like", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnNotLike(String value) {
            addCriterion("ISBN not like", value, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnIn(List<String> values) {
            addCriterion("ISBN in", values, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnNotIn(List<String> values) {
            addCriterion("ISBN not in", values, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnBetween(String value1, String value2) {
            addCriterion("ISBN between", value1, value2, "isbn");
            return (Criteria) this;
        }

        public Criteria andIsbnNotBetween(String value1, String value2) {
            addCriterion("ISBN not between", value1, value2, "isbn");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(Float value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(Float value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(Float value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(Float value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(Float value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(Float value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<Float> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<Float> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(Float value1, Float value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(Float value1, Float value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceIsNull() {
            addCriterion("current_price is null");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceIsNotNull() {
            addCriterion("current_price is not null");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceEqualTo(String value) {
            addCriterion("current_price =", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceNotEqualTo(String value) {
            addCriterion("current_price <>", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceGreaterThan(String value) {
            addCriterion("current_price >", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceGreaterThanOrEqualTo(String value) {
            addCriterion("current_price >=", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceLessThan(String value) {
            addCriterion("current_price <", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceLessThanOrEqualTo(String value) {
            addCriterion("current_price <=", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceLike(String value) {
            addCriterion("current_price like", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceNotLike(String value) {
            addCriterion("current_price not like", value, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceIn(List<String> values) {
            addCriterion("current_price in", values, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceNotIn(List<String> values) {
            addCriterion("current_price not in", values, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceBetween(String value1, String value2) {
            addCriterion("current_price between", value1, value2, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andCurrentPriceNotBetween(String value1, String value2) {
            addCriterion("current_price not between", value1, value2, "currentPrice");
            return (Criteria) this;
        }

        public Criteria andScoreIsNull() {
            addCriterion("score is null");
            return (Criteria) this;
        }

        public Criteria andScoreIsNotNull() {
            addCriterion("score is not null");
            return (Criteria) this;
        }

        public Criteria andScoreEqualTo(Float value) {
            addCriterion("score =", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotEqualTo(Float value) {
            addCriterion("score <>", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThan(Float value) {
            addCriterion("score >", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThanOrEqualTo(Float value) {
            addCriterion("score >=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThan(Float value) {
            addCriterion("score <", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThanOrEqualTo(Float value) {
            addCriterion("score <=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreIn(List<Float> values) {
            addCriterion("score in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotIn(List<Float> values) {
            addCriterion("score not in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreBetween(Float value1, Float value2) {
            addCriterion("score between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotBetween(Float value1, Float value2) {
            addCriterion("score not between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleIsNull() {
            addCriterion("number_of_people is null");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleIsNotNull() {
            addCriterion("number_of_people is not null");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleEqualTo(Integer value) {
            addCriterion("number_of_people =", value, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleNotEqualTo(Integer value) {
            addCriterion("number_of_people <>", value, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleGreaterThan(Integer value) {
            addCriterion("number_of_people >", value, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleGreaterThanOrEqualTo(Integer value) {
            addCriterion("number_of_people >=", value, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleLessThan(Integer value) {
            addCriterion("number_of_people <", value, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleLessThanOrEqualTo(Integer value) {
            addCriterion("number_of_people <=", value, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleIn(List<Integer> values) {
            addCriterion("number_of_people in", values, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleNotIn(List<Integer> values) {
            addCriterion("number_of_people not in", values, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleBetween(Integer value1, Integer value2) {
            addCriterion("number_of_people between", value1, value2, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andNumberOfPeopleNotBetween(Integer value1, Integer value2) {
            addCriterion("number_of_people not between", value1, value2, "numberOfPeople");
            return (Criteria) this;
        }

        public Criteria andBookinfoIsNull() {
            addCriterion("bookinfo is null");
            return (Criteria) this;
        }

        public Criteria andBookinfoIsNotNull() {
            addCriterion("bookinfo is not null");
            return (Criteria) this;
        }

        public Criteria andBookinfoEqualTo(String value) {
            addCriterion("bookinfo =", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoNotEqualTo(String value) {
            addCriterion("bookinfo <>", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoGreaterThan(String value) {
            addCriterion("bookinfo >", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoGreaterThanOrEqualTo(String value) {
            addCriterion("bookinfo >=", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoLessThan(String value) {
            addCriterion("bookinfo <", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoLessThanOrEqualTo(String value) {
            addCriterion("bookinfo <=", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoLike(String value) {
            addCriterion("bookinfo like", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoNotLike(String value) {
            addCriterion("bookinfo not like", value, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoIn(List<String> values) {
            addCriterion("bookinfo in", values, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoNotIn(List<String> values) {
            addCriterion("bookinfo not in", values, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoBetween(String value1, String value2) {
            addCriterion("bookinfo between", value1, value2, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andBookinfoNotBetween(String value1, String value2) {
            addCriterion("bookinfo not between", value1, value2, "bookinfo");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionIsNull() {
            addCriterion("author_introduction is null");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionIsNotNull() {
            addCriterion("author_introduction is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionEqualTo(String value) {
            addCriterion("author_introduction =", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionNotEqualTo(String value) {
            addCriterion("author_introduction <>", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionGreaterThan(String value) {
            addCriterion("author_introduction >", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionGreaterThanOrEqualTo(String value) {
            addCriterion("author_introduction >=", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionLessThan(String value) {
            addCriterion("author_introduction <", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionLessThanOrEqualTo(String value) {
            addCriterion("author_introduction <=", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionLike(String value) {
            addCriterion("author_introduction like", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionNotLike(String value) {
            addCriterion("author_introduction not like", value, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionIn(List<String> values) {
            addCriterion("author_introduction in", values, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionNotIn(List<String> values) {
            addCriterion("author_introduction not in", values, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionBetween(String value1, String value2) {
            addCriterion("author_introduction between", value1, value2, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andAuthorIntroductionNotBetween(String value1, String value2) {
            addCriterion("author_introduction not between", value1, value2, "authorIntroduction");
            return (Criteria) this;
        }

        public Criteria andCatalogIsNull() {
            addCriterion("catalog is null");
            return (Criteria) this;
        }

        public Criteria andCatalogIsNotNull() {
            addCriterion("catalog is not null");
            return (Criteria) this;
        }

        public Criteria andCatalogEqualTo(String value) {
            addCriterion("catalog =", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogNotEqualTo(String value) {
            addCriterion("catalog <>", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogGreaterThan(String value) {
            addCriterion("catalog >", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogGreaterThanOrEqualTo(String value) {
            addCriterion("catalog >=", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogLessThan(String value) {
            addCriterion("catalog <", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogLessThanOrEqualTo(String value) {
            addCriterion("catalog <=", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogLike(String value) {
            addCriterion("catalog like", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogNotLike(String value) {
            addCriterion("catalog not like", value, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogIn(List<String> values) {
            addCriterion("catalog in", values, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogNotIn(List<String> values) {
            addCriterion("catalog not in", values, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogBetween(String value1, String value2) {
            addCriterion("catalog between", value1, value2, "catalog");
            return (Criteria) this;
        }

        public Criteria andCatalogNotBetween(String value1, String value2) {
            addCriterion("catalog not between", value1, value2, "catalog");
            return (Criteria) this;
        }

        public Criteria andLabelIsNull() {
            addCriterion("label is null");
            return (Criteria) this;
        }

        public Criteria andLabelIsNotNull() {
            addCriterion("label is not null");
            return (Criteria) this;
        }

        public Criteria andLabelEqualTo(String value) {
            addCriterion("label =", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelNotEqualTo(String value) {
            addCriterion("label <>", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelGreaterThan(String value) {
            addCriterion("label >", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelGreaterThanOrEqualTo(String value) {
            addCriterion("label >=", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelLessThan(String value) {
            addCriterion("label <", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelLessThanOrEqualTo(String value) {
            addCriterion("label <=", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelLike(String value) {
            addCriterion("label like", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelNotLike(String value) {
            addCriterion("label not like", value, "label");
            return (Criteria) this;
        }

        public Criteria andLabelIn(List<String> values) {
            addCriterion("label in", values, "label");
            return (Criteria) this;
        }

        public Criteria andLabelNotIn(List<String> values) {
            addCriterion("label not in", values, "label");
            return (Criteria) this;
        }

        public Criteria andLabelBetween(String value1, String value2) {
            addCriterion("label between", value1, value2, "label");
            return (Criteria) this;
        }

        public Criteria andLabelNotBetween(String value1, String value2) {
            addCriterion("label not between", value1, value2, "label");
            return (Criteria) this;
        }

        public Criteria andImageIsNull() {
            addCriterion("image is null");
            return (Criteria) this;
        }

        public Criteria andImageIsNotNull() {
            addCriterion("image is not null");
            return (Criteria) this;
        }

        public Criteria andImageEqualTo(String value) {
            addCriterion("image =", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotEqualTo(String value) {
            addCriterion("image <>", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThan(String value) {
            addCriterion("image >", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThanOrEqualTo(String value) {
            addCriterion("image >=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThan(String value) {
            addCriterion("image <", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThanOrEqualTo(String value) {
            addCriterion("image <=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLike(String value) {
            addCriterion("image like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotLike(String value) {
            addCriterion("image not like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageIn(List<String> values) {
            addCriterion("image in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotIn(List<String> values) {
            addCriterion("image not in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageBetween(String value1, String value2) {
            addCriterion("image between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotBetween(String value1, String value2) {
            addCriterion("image not between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andSalenumberIsNull() {
            addCriterion("saleNumber is null");
            return (Criteria) this;
        }

        public Criteria andSalenumberIsNotNull() {
            addCriterion("saleNumber is not null");
            return (Criteria) this;
        }

        public Criteria andSalenumberEqualTo(Integer value) {
            addCriterion("saleNumber =", value, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberNotEqualTo(Integer value) {
            addCriterion("saleNumber <>", value, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberGreaterThan(Integer value) {
            addCriterion("saleNumber >", value, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("saleNumber >=", value, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberLessThan(Integer value) {
            addCriterion("saleNumber <", value, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberLessThanOrEqualTo(Integer value) {
            addCriterion("saleNumber <=", value, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberIn(List<Integer> values) {
            addCriterion("saleNumber in", values, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberNotIn(List<Integer> values) {
            addCriterion("saleNumber not in", values, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberBetween(Integer value1, Integer value2) {
            addCriterion("saleNumber between", value1, value2, "salenumber");
            return (Criteria) this;
        }

        public Criteria andSalenumberNotBetween(Integer value1, Integer value2) {
            addCriterion("saleNumber not between", value1, value2, "salenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberIsNull() {
            addCriterion("storeNumber is null");
            return (Criteria) this;
        }

        public Criteria andStorenumberIsNotNull() {
            addCriterion("storeNumber is not null");
            return (Criteria) this;
        }

        public Criteria andStorenumberEqualTo(Integer value) {
            addCriterion("storeNumber =", value, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberNotEqualTo(Integer value) {
            addCriterion("storeNumber <>", value, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberGreaterThan(Integer value) {
            addCriterion("storeNumber >", value, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("storeNumber >=", value, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberLessThan(Integer value) {
            addCriterion("storeNumber <", value, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberLessThanOrEqualTo(Integer value) {
            addCriterion("storeNumber <=", value, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberIn(List<Integer> values) {
            addCriterion("storeNumber in", values, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberNotIn(List<Integer> values) {
            addCriterion("storeNumber not in", values, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberBetween(Integer value1, Integer value2) {
            addCriterion("storeNumber between", value1, value2, "storenumber");
            return (Criteria) this;
        }

        public Criteria andStorenumberNotBetween(Integer value1, Integer value2) {
            addCriterion("storeNumber not between", value1, value2, "storenumber");
            return (Criteria) this;
        }

        public Criteria andClassIdIsNull() {
            addCriterion("class_id is null");
            return (Criteria) this;
        }

        public Criteria andClassIdIsNotNull() {
            addCriterion("class_id is not null");
            return (Criteria) this;
        }

        public Criteria andClassIdEqualTo(Integer value) {
            addCriterion("class_id =", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotEqualTo(Integer value) {
            addCriterion("class_id <>", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdGreaterThan(Integer value) {
            addCriterion("class_id >", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("class_id >=", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdLessThan(Integer value) {
            addCriterion("class_id <", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdLessThanOrEqualTo(Integer value) {
            addCriterion("class_id <=", value, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdIn(List<Integer> values) {
            addCriterion("class_id in", values, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotIn(List<Integer> values) {
            addCriterion("class_id not in", values, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdBetween(Integer value1, Integer value2) {
            addCriterion("class_id between", value1, value2, "classId");
            return (Criteria) this;
        }

        public Criteria andClassIdNotBetween(Integer value1, Integer value2) {
            addCriterion("class_id not between", value1, value2, "classId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}