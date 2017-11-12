module LinksHelper
  def perform_link(link)
    if link.private?
      name, href = 'Share', share_link_path(link)
    else
      name, href = 'Hide', hide_link_path(link)
    end

    link_to name, href, method: :patch, data: {confirm: 'You sure?'}, class: 'btn btn-primary'
  end

  def get_formatted_tags(link)
    return 'Link have no tags' unless link.tag_list.present?
    link.tag_list
  end
end
