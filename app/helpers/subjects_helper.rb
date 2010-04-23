module SubjectsHelper
  def decade_view(bibliome)
    start_decade = (bibliome.start_year / 10).round * 10
    end_decade = (bibliome.end_year / 10).round * 10
    decades = []
    start_decade.step(end_decade, 10) do |decade|
      li = []
      subjects = BibliomeSubject.find(:all,:conditions => ["bibliome_id = ? and year >= ? and year < ?", bibliome.id, decade, decade + 10], :include => :subject).group_by(&:subject_id)
      ss = subjects.keys.map do |subject_id|
        articles = subjects[subject_id].inject(0) {|sum, bs| sum + bs.articles_count}
        subject = subjects[subject_id][0].subject
        [subject_id, articles, subject]
      end
      ss.sort! {|a, b| b[1] <=> a[1] || a[2].term <=> b[2].term}
      ss = ss.size > 10 ? ss[0 .. 9] : ss
      ss.each do |ss|
        sl = link_to(ss[2].term, bibliome_subject_path(bibliome, ss[2], :period => @link_period)) + " " + count(ss[1])
        li.push(content_tag(:li, sl))
      end
      #ss.sort! {|a, b| b[1] <=> a[1]}
      decades.push(content_tag(:div, content_tag(:h3, "#{decade}s") + content_tag(:ol, li.join("\n")), :class => "top_neighbors"))
    end
    content_tag(:div, decades.join("\n"))
  end
end
