/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msindreu <msindreu@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/17 18:08:03 by msindreu          #+#    #+#             */
/*   Updated: 2022/06/17 19:52:25 by msindreu         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*new;
	t_list	*element;

	new = 0;
	while (lst != NULL)
	{
		element = ft_lstnew(f(lst->content));
		if (element == NULL)
		{
			if (element->content != NULL)
				free(element->content);
			ft_lstclear(&new, del);
			return (NULL);
		}
		ft_lstadd_back(&new, element);
		lst = lst->next;
	}
	return (new);
}
