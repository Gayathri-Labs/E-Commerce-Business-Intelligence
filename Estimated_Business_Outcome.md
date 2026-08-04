**E-COMMERCE BI SYSTEM ANALYSIS — ESTIMATED BUSINESS IMPACT**

Dataset: cleaned\_ecommerce\_dataset.csv (113,270 orders)

=====================================================



**METHOD:**



\- Aggregated sales and profit across category, customer segment, region,

&#x20; shipping type, and individual products.

\- Flagged loss-making orders/products and measured delivery reliability by

&#x20; shipping type to find operational levers tied to profitability.

\- Checked whether discounting or delivery delay actually drive losses, to

&#x20; separate real signal from coincidence.



**KEY FINDINGS:**



1\. Scale: $23,163,663 in total sales, $2,613,069 in total profit

&#x20;  (11.3% blended margin) across 113,270 orders.



2\. Margin leakage: 19.3% of all orders (21,893 orders) are loss-making,

&#x20;  representing $4,432,892 in sales value that nets out to a combined

&#x20;  -$2,428,552 loss. This is the single biggest profitability issue in the

&#x20;  data.



3\. Loss-making products: 123 of 1,849 products (6.7% of the catalog) are

&#x20;  net-loss products overall, cumulatively losing $64,559. A small, specific

&#x20;  list of SKUs (e.g., a conference table, a gaming keyboard, an office

&#x20;  chair) drive most of this — each losing $1,300-$2,600 in aggregate.



4\. Shipping reliability paradox: First Class shipping — the most expensive

&#x20;  tier — has a 95.0% late-delivery rate, and Second Class is late 76.4% of

&#x20;  the time. Standard Class (the cheapest, highest-volume option) is late

&#x20;  only 38.1% of the time and actually arrives slightly early on average.

&#x20;  Customers who pay more for faster shipping are, in this data, getting the

&#x20;  least reliable delivery experience.



5\. What does NOT drive loss (important negative findings, worth stating

&#x20;  honestly): delivery delay has virtually no correlation with profit

&#x20;  (r = -0.005), and higher discount % does not correspond to a higher loss

&#x20;  rate (\~19% loss rate across all discount bands). So the losses are not

&#x20;  simply "discount too deep" or "shipped late" — they trace to specific

&#x20;  underpriced products, not general operational delay.



6\. Segment/category mix: Office Supplies is the largest category by profit

&#x20;  ($1.58M), and Consumer is the most profitable customer segment ($1.37M of

&#x20;  the $2.61M total profit). All three categories carry a similar \~11%

&#x20;  margin, so category mix isn't the differentiator either — product-level

&#x20;  pricing is.



**ESTIMATED BUSINESS OUTCOME:**



\- Repricing or discontinuing the **123** identified loss-making products would

&#x20; directly recover an estimated **$64,559** in cumulative losses with no change

&#x20; to sales volume elsewhere.



\- More broadly, since **19.3%** of orders are loss-making and this isn't

&#x20; explained by discounting or delivery delay, a pricing/COGS audit focused

&#x20; on order-level margin (rather than a blanket discount cut) is the more

&#x20; targeted fix — even recovering half of the **$2.43M** in order-level losses

&#x20; would be a **\~1.2M profit** improvement (**\~47% profit uplift on the $2.61M**

&#x20; **base**).



\- Fixing the shipping reliability paradox (making First/Second Class

&#x20; actually faster than Standard) protects revenue tied to premium-shipping

&#x20; customers, who are currently the most likely to have a poor delivery

&#x20; experience despite paying the most.



